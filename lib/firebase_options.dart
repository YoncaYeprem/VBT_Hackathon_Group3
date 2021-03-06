// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: '',
    appId: '1:1021459720317:web:8a5b99e8571322f64de914',
    messagingSenderId: '1021459720317',
    projectId: 'vbt-hackathon',
    authDomain: 'vbt-hackathon.firebaseapp.com',
    storageBucket: 'vbt-hackathon.appspot.com',
    measurementId: 'G-MBHQL4G079',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: '',
    appId: '1:1021459720317:android:4ddc84492d9c6a3f4de914',
    messagingSenderId: '1021459720317',
    projectId: 'vbt-hackathon',
    storageBucket: 'vbt-hackathon.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: '',
    appId: '1:1021459720317:ios:d56e10f8910c08b84de914',
    messagingSenderId: '1021459720317',
    projectId: 'vbt-hackathon',
    storageBucket: 'vbt-hackathon.appspot.com',
    iosClientId: '1021459720317-fifkmorlh7h1l0i5i80dr01cgqun9499.apps.googleusercontent.com',
    iosBundleId: 'com.example.vbtHackathonGroup3',
  );
}
