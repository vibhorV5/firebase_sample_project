import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;
  final currentUser = FirebaseAuth.instance.currentUser;
  final userStream = FirebaseAuth.instance.authStateChanges();

  //Sign in Anonymously
  Future signInAnonymously() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      User user = userCredential.user!;
      debugPrint('User Id = ${user.uid}');
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  //Logout
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      // debugPrint(currentUser!.uid);
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
    }
  }
}
