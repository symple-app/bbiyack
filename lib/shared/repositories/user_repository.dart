import 'package:flutter/foundation.dart';
import 'package:hackerton_gdg/features/authentication/models/authentication.model.dart';
import 'package:hackerton_gdg/shared/models/user_model.dart';

class UserRepository {
  late SympleUser _user;

  Future<SympleUser?> getUser(AuthenticationUser user) async {
    try {
      return null;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<SympleUser?> getUserForPhoneNumber(String uid) async {
    try {
      // if (userDataResponse.isNotEmpty) {
      //   SympleUser userData = SympleUser.fromMap(userDataResponse);

      //   _user = userData;

      //   return userData;
      // }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
    return null;
  }

  Future<void> saveUser(Object insertValue) async {}

  SympleUser? get currentUser => _user;
}
