import 'package:bubble_tea_app/components/alert_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void verifyEmailAndPass(context, String email, String pass) async {
    try {
      UserCredential? userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      displayErrorMessage(context, e.message);
    }
  }

  void registerEmailAndPassword(context, String email, String pass) async {
    try {
      UserCredential? userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: pass);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      displayErrorMessage(context, e.message);
    }
  }

  void logOut() {
    FirebaseAuth.instance.signOut();
  }

  signInWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    if (gUser == null) {
      return;
    }
    final GoogleSignInAuthentication gAuth = await gUser.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken, idToken: gAuth.idToken);
    return await _firebaseAuth.signInWithCredential(credential);
  }
}
