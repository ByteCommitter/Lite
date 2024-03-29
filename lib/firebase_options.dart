// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
    apiKey: 'AIzaSyA2L9kQUKwuW1dokqTA1n6n8cHLI1FNxuc',
    appId: '1:121217784032:web:d91c2bf0ce59bee7b99885',
    messagingSenderId: '121217784032',
    projectId: 'litefetch',
    authDomain: 'litefetch.firebaseapp.com',
    storageBucket: 'litefetch.appspot.com',
    measurementId: 'G-BJK5KDWMKL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBW-C_JRzYGczmQIioEzZgV_cxhvCWEUJw',
    appId: '1:121217784032:android:6066901139368ff6b99885',
    messagingSenderId: '121217784032',
    projectId: 'litefetch',
    storageBucket: 'litefetch.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCOsxaBXbpuo1X-t3D1J5cUx-nTCT_yxjU',
    appId: '1:121217784032:ios:98a56db43fae5714b99885',
    messagingSenderId: '121217784032',
    projectId: 'litefetch',
    storageBucket: 'litefetch.appspot.com',
    iosBundleId: 'com.example.hydlite',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCOsxaBXbpuo1X-t3D1J5cUx-nTCT_yxjU',
    appId: '1:121217784032:ios:7b201abcd43b7f01b99885',
    messagingSenderId: '121217784032',
    projectId: 'litefetch',
    storageBucket: 'litefetch.appspot.com',
    iosBundleId: 'com.example.hydlite.RunnerTests',
  );
}
