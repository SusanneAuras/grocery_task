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
    apiKey: 'AIzaSyCfsqLfomC_7DrzmVzvIWT7j7l4MusnguA',
    appId: '1:123414188116:web:8e48c458f0563e3d10ddc1',
    messagingSenderId: '123414188116',
    projectId: 'grocery-task-susanne',
    authDomain: 'grocery-task-susanne.firebaseapp.com',
    storageBucket: 'grocery-task-susanne.appspot.com',
    measurementId: 'G-6Y80T7CF6E',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBO0CVuSxeF_NC2oi362nbi-pCk5cpo8Yk',
    appId: '1:123414188116:android:24cdea417dfc329810ddc1',
    messagingSenderId: '123414188116',
    projectId: 'grocery-task-susanne',
    storageBucket: 'grocery-task-susanne.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAJ4k0tV6wPFg98yKesC6FkWfwnaIELkyQ',
    appId: '1:123414188116:ios:0b555a83ff5ec35c10ddc1',
    messagingSenderId: '123414188116',
    projectId: 'grocery-task-susanne',
    storageBucket: 'grocery-task-susanne.appspot.com',
    iosBundleId: 'com.example.groceryTask',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAJ4k0tV6wPFg98yKesC6FkWfwnaIELkyQ',
    appId: '1:123414188116:ios:1b0280416b01ff3810ddc1',
    messagingSenderId: '123414188116',
    projectId: 'grocery-task-susanne',
    storageBucket: 'grocery-task-susanne.appspot.com',
    iosBundleId: 'com.example.groceryTask.RunnerTests',
  );
}
