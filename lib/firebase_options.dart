import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
      case TargetPlatform.linux:
      default:
        return web;
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyD4gFHOOyBQh3_cxhueYBy8BoDEvRw6G9Y',
    appId: '1:715945631757:web:016c573b0174fa0ff6f544',
    messagingSenderId: '715945631757',
    projectId: 'haroon-portfolio-99698',
    authDomain: 'haroon-portfolio-99698.firebaseapp.com',
    storageBucket: 'haroon-portfolio-99698.firebasestorage.app',
    measurementId: 'G-DMZRZRHL9J',
  );
}
