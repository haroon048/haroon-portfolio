import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:haroon_portfolio/firebase_options.dart';

class FirebaseSetup {
  static bool isReady = false;

  static Future<void> initialize() async {
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      isReady = true;
    } catch (e) {
      isReady = false;
      debugPrint('Firebase init failed, continuing without Firebase: $e');
    }
  }
}
