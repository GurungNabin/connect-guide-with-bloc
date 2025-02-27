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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyB0OZt4wkZN2d69x1FY8wtha9-pBZLrvPQ',
    appId: '1:980536009790:web:a9635e3489d7e282939d6f',
    messagingSenderId: '980536009790',
    projectId: 'connect-guide-ffbe8',
    authDomain: 'connect-guide-ffbe8.firebaseapp.com',
    storageBucket: 'connect-guide-ffbe8.firebasestorage.app',
    measurementId: 'G-QK5X19R6V4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC6THECbMnwbl0eaXw_VsedfHLX9kChTjw',
    appId: '1:980536009790:android:76d2a50dc0d5f49f939d6f',
    messagingSenderId: '980536009790',
    projectId: 'connect-guide-ffbe8',
    storageBucket: 'connect-guide-ffbe8.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC7Fd4OzFI_qWY8a79A-LZUhVJojSWPfrU',
    appId: '1:980536009790:ios:241802fc3cde6b13939d6f',
    messagingSenderId: '980536009790',
    projectId: 'connect-guide-ffbe8',
    storageBucket: 'connect-guide-ffbe8.firebasestorage.app',
    iosBundleId: 'com.example.connectGuide',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC7Fd4OzFI_qWY8a79A-LZUhVJojSWPfrU',
    appId: '1:980536009790:ios:241802fc3cde6b13939d6f',
    messagingSenderId: '980536009790',
    projectId: 'connect-guide-ffbe8',
    storageBucket: 'connect-guide-ffbe8.firebasestorage.app',
    iosBundleId: 'com.example.connectGuide',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB0OZt4wkZN2d69x1FY8wtha9-pBZLrvPQ',
    appId: '1:980536009790:web:a69ca7080c2c26f4939d6f',
    messagingSenderId: '980536009790',
    projectId: 'connect-guide-ffbe8',
    authDomain: 'connect-guide-ffbe8.firebaseapp.com',
    storageBucket: 'connect-guide-ffbe8.firebasestorage.app',
    measurementId: 'G-GVV7S527E6',
  );
}
