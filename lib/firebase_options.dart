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
    apiKey: 'AIzaSyCVSkJKZZitl2__sWXsiw0-E6p5ACEKlCU',
    appId: '1:274883487648:web:9ed2140e9619160af7e6c5',
    messagingSenderId: '274883487648',
    projectId: 'flutter-firebase-ders-bea34',
    authDomain: 'flutter-firebase-ders-bea34.firebaseapp.com',
    storageBucket: 'flutter-firebase-ders-bea34.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBl1_gtryRjTysEoqYpgFw2kwzN3VH4gEI',
    appId: '1:274883487648:android:a238dbb4a41dd420f7e6c5',
    messagingSenderId: '274883487648',
    projectId: 'flutter-firebase-ders-bea34',
    storageBucket: 'flutter-firebase-ders-bea34.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA2JoljUQMXSta02WFUq1ADsJb6aq2NfSw',
    appId: '1:274883487648:ios:b850cebb1b215100f7e6c5',
    messagingSenderId: '274883487648',
    projectId: 'flutter-firebase-ders-bea34',
    storageBucket: 'flutter-firebase-ders-bea34.appspot.com',
    iosClientId: '274883487648-7frd8fvhajc20epri27s174n57lo8b4p.apps.googleusercontent.com',
    iosBundleId: 'com.ahmetyunus-fir',
  );
}
