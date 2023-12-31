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
    apiKey: 'AIzaSyB14fp-59Tiiv2KPb7fOVe58Adzo-LwrWw',
    appId: '1:1019099055197:web:e6a739184b01f9ed68f9b4',
    messagingSenderId: '1019099055197',
    projectId: 'aso-ads-app',
    authDomain: 'aso-ads-app.firebaseapp.com',
    storageBucket: 'aso-ads-app.appspot.com',
    measurementId: 'G-5NV1JHC8ZX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCD8_7VPRQgXS0vlTAZLT8jiioRKS3EzGU',
    appId: '1:1019099055197:android:288a3562007350d568f9b4',
    messagingSenderId: '1019099055197',
    projectId: 'aso-ads-app',
    storageBucket: 'aso-ads-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB9vV4qI0NbHdYGmgmGv4vet02O6StPKzU',
    appId: '1:1019099055197:ios:67eeca3480bb299468f9b4',
    messagingSenderId: '1019099055197',
    projectId: 'aso-ads-app',
    storageBucket: 'aso-ads-app.appspot.com',
    iosBundleId: 'com.example.adsAsoApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB9vV4qI0NbHdYGmgmGv4vet02O6StPKzU',
    appId: '1:1019099055197:ios:67eeca3480bb299468f9b4',
    messagingSenderId: '1019099055197',
    projectId: 'aso-ads-app',
    storageBucket: 'aso-ads-app.appspot.com',
    iosBundleId: 'com.example.adsAsoApp',
  );
}
