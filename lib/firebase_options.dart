// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyA1xwzW3_pslzis2aOYxAbzWh4KHWDj_aA',
    appId: '1:941708243242:web:ff61c6b5140cf8648eae53',
    messagingSenderId: '941708243242',
    projectId: 'symple-bbiyack',
    authDomain: 'symple-bbiyack.firebaseapp.com',
    storageBucket: 'symple-bbiyack.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBWpgG_IJTb5des8AL35NUa-TSyIk9ldfY',
    appId: '1:941708243242:android:10eafb3510af1dbf8eae53',
    messagingSenderId: '941708243242',
    projectId: 'symple-bbiyack',
    storageBucket: 'symple-bbiyack.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBV0g2RD9vG6S1EYB3-Eo7nj7yH0wcu1tU',
    appId: '1:941708243242:ios:d240945c03a158358eae53',
    messagingSenderId: '941708243242',
    projectId: 'symple-bbiyack',
    storageBucket: 'symple-bbiyack.firebasestorage.app',
    iosBundleId: 'com.symplebbiyack',
  );
}
