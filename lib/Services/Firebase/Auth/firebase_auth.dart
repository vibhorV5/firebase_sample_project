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
      User? user = userCredential.user;
      debugPrint('User Id = ${user!.uid}');
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  // Register with email and password
  Future registerUser({
    required TextEditingController email,
    required TextEditingController password,
  }) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );

      User? user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  //Sign In using email and password
  Future signIn({
    required TextEditingController email,
    required TextEditingController password,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email.text, password: password.text);

      User? user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        debugPrint('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong password provided for that user.');
      }
    } catch (e) {
      debugPrint(e.toString());
      return (null);
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
