import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:hackerton_gdg/features/authentication/models/authentication.model.dart';
import 'package:hackerton_gdg/shared/models/user_model.dart';

class UserRepository {
  final SupabaseClient supabase = Supabase.instance.client;

  late SympleUser _user;

  Future<SympleUser?> getUser(AuthenticationUser user) async {
    try {
      String? uid = user.uid;

      if (uid != null) {
        final userDataResponse =
            await supabase.from('user').select('*').eq('uid', uid).single();

        SympleUser userData = SympleUser.fromMap(userDataResponse);
        _user = userData;

        return userData;
      }

      return null;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }

    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // final String? authenticationJsonUser = prefs.getString(_userKey);

    // debugPrint("Saved AuthenticationUser :  $authenticationJsonUser");

    // if (authenticationJsonUser != null) {
    //   return SympleUser.fromJson(authenticationJsonUser);
    // } else {
    //   return null;
    // }
  }

  Future<SympleUser?> getUserForPhoneNumber(String uid) async {
    try {
      final userDataResponse =
          await supabase.from('user').select('*').eq('uid', uid).single();

      if (userDataResponse.isNotEmpty) {
        SympleUser userData = SympleUser.fromMap(userDataResponse);

        _user = userData;

        return userData;
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
    return null;
  }

  Future<void> saveUser(Object insertValue) async {
    final response = await supabase.from('user').insert(insertValue);

    debugPrint(response);

    // if (response.error != null) {
    //   throw Exception("user save Failed");
    // }
  }

  SympleUser? get currentUser => _user;
}
