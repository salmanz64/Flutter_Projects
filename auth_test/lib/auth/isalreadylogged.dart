import 'package:auth_test/auth/login_or_register.dart';
import 'package:auth_test/pages/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Isalreadylogged extends StatelessWidget {
  const Isalreadylogged({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const HomeScreen();
        } else {
          return const LoginOrRegister();
        }
      },
    );
  }
}
