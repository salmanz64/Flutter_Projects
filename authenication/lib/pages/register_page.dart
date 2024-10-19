import 'package:authenication/components/my_button.dart';
import 'package:authenication/components/text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../helper/helperfunction.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final email = TextEditingController();
  final password = TextEditingController();
  final username = TextEditingController();
  final cfPassword = TextEditingController();

  void registerUser() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    if (cfPassword.text != password.text) {
      displayMsgToUser("Passwords do not match", context);

      Navigator.of(context).pop();
    }

    try {
      UserCredential? userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.text, password: password.text);
      createUserDocument(userCredential);
      if (context.mounted) {
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();
      displayMsgToUser(e.code, context);
    }
  }

  Future<void> createUserDocument(UserCredential? userCredential) async {
    if (userCredential != null && userCredential.user != null) {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(userCredential.user!.email)
          .set({
        'email': userCredential.user!.email,
        'username': username.text,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.person, size: 80),
            const SizedBox(
              height: 25,
            ),
            const Text(
              "M I N I M A L",
              style: TextStyle(fontSize: 25),
            ),
            const SizedBox(
              height: 45,
            ),
            MyTextField(
                controller: username,
                hintText: "Username",
                onTap: () {},
                obscureText: false),
            const SizedBox(
              height: 10,
            ),
            MyTextField(
                controller: email,
                hintText: "Email",
                onTap: () {},
                obscureText: false),
            const SizedBox(
              height: 10,
            ),
            MyTextField(
                controller: password,
                hintText: "Password",
                onTap: () {},
                obscureText: true),
            const SizedBox(
              height: 10,
            ),
            MyTextField(
                controller: cfPassword,
                hintText: "Confirm Password",
                onTap: () {},
                obscureText: true),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Forgot Password?",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.secondary),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            MyButton(onTap: () => registerUser(), text: "Register"),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.secondary),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: const Text(
                    "Register here",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
