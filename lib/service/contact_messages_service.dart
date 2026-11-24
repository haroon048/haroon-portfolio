import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:haroon_portfolio/service/firebase_setup.dart';

class ContactMessagesService {
  static Future<void> saveMessage({
    required String name,
    required String contact,
    required String projectType,
    required String message,
  }) async {
    if (!FirebaseSetup.isReady || Firebase.apps.isEmpty) {
      throw StateError('Firebase is not ready');
    }
    await FirebaseFirestore.instance.collection('contact_messages').add(
      <String, Object>{
        'name': name,
        'contact': contact,
        'projectType': projectType,
        'message': message,
        'createdAt': FieldValue.serverTimestamp(),
        'source': 'portfolio',
      },
    );
  }
}
