import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackerton_gdg/features/authentication/blocs/authentication.bloc.dart';
import 'package:hackerton_gdg/features/authentication/models/authentication.model.dart';
import 'package:hackerton_gdg/features/authentication/repositoties/authentication.repository.dart';
import 'package:hackerton_gdg/features/authentication/presentation/pages/gender_and_birth_page.dart';
import 'package:hackerton_gdg/features/authentication/presentation/pages/nickname_page.dart';
import 'package:hackerton_gdg/features/authentication/presentation/pages/phone_auth_page.dart';
import 'package:hackerton_gdg/features/authentication/presentation/pages/phone_verify_page.dart';
import 'package:hackerton_gdg/features/character/presentation/pages/select_character_page.dart';

import 'package:hackerton_gdg/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:hackerton_gdg/shared/provider/mentor/mentor_provider.dart';

import 'package:hackerton_gdg/shared/repositories/user_repository.dart';
import 'package:hackerton_gdg/shared/utils/observer_util.dart';
import 'package:hackerton_gdg/global/themes/color_theme.dart';
import 'package:hackerton_gdg/splash.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final UserRepository _userRepository;
  late final AuthenticationRepository _authenticationRepository;

  @override
  void initState() {
    super.initState();
    _userRepository = UserRepository();
    _authenticationRepository = AuthenticationRepository();
  }

  @override
  void dispose() {
    _authenticationRepository.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _authenticationRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            lazy: false,
            create: (_) => AuthenticationBloc(
              authenticationRepository: _authenticationRepository,
              userRepository: _userRepository,
            )..add(AuthenticationSubscriptionRequested()),
          ),
        ],
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(
                create: (BuildContext context) => MentorProvider()),
          ],
          child: const AppView(),
        ),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      navigatorObservers: [ObserverUtils.routeObserver],
      debugShowCheckedModeBanner: false,
      title: 'SYMPLE',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Pretendard',
        highlightColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        focusColor: ColorTheme.of(context).static.white,
        scaffoldBackgroundColor: ColorTheme.of(context).static.white,
        appBarTheme: AppBarTheme(
          backgroundColor: ColorTheme.of(context).static.white,
          foregroundColor: ColorTheme.of(context).static.white,
          surfaceTintColor: ColorTheme.of(context).static.white,
        ),
      ),
      onGenerateRoute: (_) => Splash.route(),
      builder: (context, child) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            debugPrint("Current State : $state");

            switch (state.status) {
              case AuthenticationStatus.authenticated:
                _navigator.pushAndRemoveUntil(
                  SelectCharacterPage.route(),
                  (route) => false,
                );
              case AuthenticationStatus.unauthenticated:
                _handleUnauthenticatedState(context, state);
                break;

              case AuthenticationStatus.unknown:
                break;
            }
          },
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: const TextScaler.linear(1.0),
              boldText: false,
            ),
            child: child!,
          ),
        );
      },
    );
  }

  void _handleUnauthenticatedState(
      BuildContext context, AuthenticationState state) {
    switch (state.step) {
      case AuthenticationStep.onboarding:
      // _navigator.push(OnboardingPage.route());
      // break;

      case AuthenticationStep.nickname:
        _navigator.push(NicknamePage.route());
        break;

      case AuthenticationStep.genderAndBirthYear:
        _navigator.push(GenderAndBirthPage.route());
        break;

      case AuthenticationStep.phoneNumber:
        _navigator.push(PhoneAuthPage.route());
        break;

      case AuthenticationStep.accessCode:
        _navigator.push(
          PhoneVerifyPage.route(state.verificationId),
        );
        break;
    }
  }
}
