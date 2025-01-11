import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hackerton_gdg/features/authentication/models/authentication.model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();

  static const String _userKey = 'userId';

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
    final database = FirebaseFirestore.instance;
    final response = await database.collection("users").add(user.toMap());

    print('Saved to Firestore userId is : ${response.id}');

    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_userKey, response.id);
  }

  Future<AuthenticationUser?> getAuthenticationUser() async {
    final database = FirebaseFirestore.instance;

    await Future.delayed(const Duration(milliseconds: 300));

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userId = prefs.getString(_userKey);

    if (userId != null) {
      final userDataResponse =
          await database.collection("users").doc(userId).get();

      if (userDataResponse.exists) {
        final userDataToMap = userDataResponse.data();

        print(userDataToMap);

        final userData = AuthenticationUser.fromMap(userDataToMap!);

        return userData;
      }

      return null;
      // return AuthenticationUser.fromJson(authenticationJsonUser);
    } else {
      return null;
    }
  }

  void dispose() => _controller.close();
}
