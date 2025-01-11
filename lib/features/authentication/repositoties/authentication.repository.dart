import 'dart:async';

import 'package:hackerton_gdg/features/authentication/models/authentication.model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();

  static const String _userKey = 'user';

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unknown;
    yield* _controller.stream;
  }

  Future<void> login() async {
    await Future.delayed(
      const Duration(milliseconds: 300),
      () => _controller.add(AuthenticationStatus.authenticated),
    );
  }

  Future<void> logOut() async {
    _controller.add(AuthenticationStatus.unauthenticated);

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
  }

  Future<void> saveAuthenticationUser(AuthenticationUser user) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_userKey, user.toJson());
  }

  Future<AuthenticationUser?> getAuthenticationUser() async {
    await Future.delayed(const Duration(milliseconds: 300));

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? authenticationJsonUser = prefs.getString(_userKey);

    if (authenticationJsonUser != null) {
      return AuthenticationUser.fromJson(authenticationJsonUser);
    } else {
      return null;
    }
  }

  void dispose() => _controller.close();
}
