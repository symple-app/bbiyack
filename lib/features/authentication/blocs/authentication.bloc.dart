import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:hackerton_gdg/features/authentication/models/authentication.model.dart';
import 'package:hackerton_gdg/features/authentication/repositoties/authentication.repository.dart';
import 'package:hackerton_gdg/shared/models/user_model.dart';
import 'package:hackerton_gdg/shared/repositories/user_repository.dart';

part 'authentication.event.dart';
part 'authentication.state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;

  AuthenticationBloc({
    required AuthenticationRepository authenticationRepository,
    required UserRepository userRepository,
  })  : _authenticationRepository = authenticationRepository,
        _userRepository = userRepository,
        super(const AuthenticationState.unknown()) {
    on<AuthenticationSubscriptionRequested>(_onSubscriptionRequested);
    on<AuthenticationLogoutPressed>(_onLogoutPressed);
    on<AuthenticationFieldChanged>(_onFieldChanged);
    on<AuthenticationVerificationId>(_onGetVerficationId);
    on<AuthenticationVerifyCode>(_onVerifyCode);
    on<AuthenticationPressedNextButton>(_onPressedNextButton);
  }

  String _verificationId = '';

  void _onPressedNextButton(
    AuthenticationPressedNextButton event,
    Emitter<AuthenticationState> emit,
  ) {}

  Future<void> _onSubscriptionRequested(
    AuthenticationSubscriptionRequested event,
    Emitter<AuthenticationState> emit,
  ) {
    return emit.onEach(
      _authenticationRepository.status,
      onData: (status) async {
        switch (status) {
          case AuthenticationStatus.unauthenticated:
            return emit(const AuthenticationState.unauthenticated());
          case AuthenticationStatus.authenticated:
            final user = await _tryGetUser();
            return emit(
              user != null && !user.hasNullFields()
                  ? AuthenticationState.authenticated(user)
                  : const AuthenticationState.unauthenticated(),
            );
          case AuthenticationStatus.unknown:
            final user = await _tryGetUser();

            return emit(
              user != null && !user.hasNullFields()
                  ? AuthenticationState.authenticated(user)
                  : const AuthenticationState.unauthenticated(),
            );
        }
      },
      onError: addError,
    );
  }

  void _onLogoutPressed(
    AuthenticationLogoutPressed event,
    Emitter<AuthenticationState> emit,
  ) {
    _authenticationRepository.logOut();
    emit(state.copyWith(
      status: AuthenticationStatus.unauthenticated,
      user: AuthenticationUser.empty,
      step: AuthenticationStep.onboarding,
      verificationId: '',
    ));
  }

  Future<AuthenticationUser?> _tryGetUser() async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      User? firebaseAuthUser = auth.currentUser;

      if (firebaseAuthUser != null) {
        print("Firebase User Data is : $firebaseAuthUser");
      }

      AuthenticationUser? user =
          await _authenticationRepository.getAuthenticationUser();

      if (user != null) {
        SympleUser? sympleUserData = await _userRepository.getUser(user);

        if (sympleUserData != null) {
          user = user.copyWith(id: sympleUserData.id);
        }
      }

      return user;
    } catch (_) {
      return null;
    }
  }

  void _onFieldChanged(
    AuthenticationFieldChanged event,
    Emitter<AuthenticationState> emit,
  ) {
    AuthenticationStep step;

    final updatedUser = state.user.copyWith(
      nickname: event.fieldType == FieldType.nickname
          ? event.value
          : state.user.nickname,
      gender: event.fieldType == FieldType.genderAndBirthYear
          ? event.value.split('/')[0]
          : state.user.gender,
      birthYear: event.fieldType == FieldType.genderAndBirthYear
          ? event.value.split('/')[1]
          : state.user.birthYear,
      phoneNumber: event.fieldType == FieldType.phone
          ? event.value
          : state.user.phoneNumber,
      trigger: DateTime.now().millisecondsSinceEpoch,
    );

    switch (event.fieldType) {
      case FieldType.nickname:
        step = AuthenticationStep.phoneNumber;
        break;
      case FieldType.genderAndBirthYear:
        step = AuthenticationStep.phoneNumber;
        break;
      case FieldType.phone:
        step = AuthenticationStep.accessCode;
        break;
    }

    emit(state.copyWith(
      user: updatedUser,
      step: step,
      verificationId: _verificationId,
    ));
  }

  void _onGetVerficationId(
    AuthenticationVerificationId event,
    Emitter<AuthenticationState> emit,
  ) {
    _verificationId = event.verificationId;
  }

  void _onVerifyCode(
    AuthenticationVerifyCode event,
    Emitter<AuthenticationState> emit,
  ) async {
    if (event.code.length == 6) {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: event.code,
      );

      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        User? user = userCredential.user;
        if (user != null) {
          debugPrint('Login Success : ${user.uid}');

          SympleUser? sympleUserData =
              await _userRepository.getUserForPhoneNumber(user.uid);

          AuthenticationUser verifiedUser = sympleUserData != null
              ? state.user.copyWithSympleUser(sympleUserData)
              : state.user.copyWith(uid: user.uid);

          await _authenticationRepository.saveAuthenticationUser(
            verifiedUser,
          );

          if (sympleUserData == null) {
            await _userRepository.saveUser(verifiedUser.saveToMap());
          }

          emit(
            state.copyWith(
              user: verifiedUser,
              status: AuthenticationStatus.authenticated,
            ),
          );
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'invalid-verification-code') {
          debugPrint('잘못된 인증 코드입니다.');
          // 인증 코드 오류 처리 로직
        } else if (e.code == 'user-not-found') {
          debugPrint('사용자를 찾을 수 없습니다.');
          // 사용자 존재하지 않는 경우 처리
        } else {
          debugPrint('로그인 실패: ${e.message}');
          // 기타 예외 처리
        }
      } catch (e) {
        debugPrint('예상치 못한 오류: $e');
        // 그 외의 오류 처리
      }
    }
  }
}
