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
    apiKey: 'AIzaSyAFYZeBqHUQ2IOe70EoqK4E7CBhg890V5c',
    appId: '1:404631568000:web:266f3a2bc21bc83f45f065',
    messagingSenderId: '404631568000',
    projectId: 'flutterpractice-6f936',
    authDomain: 'flutterpractice-6f936.firebaseapp.com',
    storageBucket: 'flutterpractice-6f936.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDaOFhPLtB6J04iQAkQN7n5UdNZBTSwDv8',
    appId: '1:404631568000:android:92b15304ca93b73d45f065',
    messagingSenderId: '404631568000',
    projectId: 'flutterpractice-6f936',
    storageBucket: 'flutterpractice-6f936.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC1dOOtMFlpAxKen7jr8AbPAY0ey7dspI0',
    appId: '1:404631568000:ios:c03ebddc6324fe3045f065',
    messagingSenderId: '404631568000',
    projectId: 'flutterpractice-6f936',
    storageBucket: 'flutterpractice-6f936.appspot.com',
    iosBundleId: 'com.example.flutterPractice',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAFYZeBqHUQ2IOe70EoqK4E7CBhg890V5c',
    appId: '1:404631568000:web:302435fd834e904545f065',
    messagingSenderId: '404631568000',
    projectId: 'flutterpractice-6f936',
    authDomain: 'flutterpractice-6f936.firebaseapp.com',
    storageBucket: 'flutterpractice-6f936.appspot.com',
  );
}
