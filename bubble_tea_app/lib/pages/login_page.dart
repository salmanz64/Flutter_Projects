import 'package:bubble_tea_app/components/alert_message.dart';
import 'package:bubble_tea_app/components/my_button.dart';
import 'package:bubble_tea_app/components/my_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final void Function()? onTap;
  LoginPage({super.key, required this.onTap});

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  void checkCredentials(context) async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });

    if (pass.text.isEmpty && email.text.isEmpty) {
      Navigator.pop(context);
      displayErrorMessage(context, "Pass or Email Is Empty");
    } else {
      try {
        UserCredential? userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email.text, password: pass.text);
        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        displayErrorMessage(context, e.message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.brown[300],
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.03,
            ),
            Image.asset(
              'lib/assets/bubble_tea_1.png',
              width: width * 0.7,
            ),
            Text(
              "Boba Is Life",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            MyTextfield(
              controller: email,
              hintText: "Email",
            ),
            SizedBox(
              height: height * 0.02,
            ),
            MyTextfield(
              controller: pass,
              hintText: "Password",
            ),
            SizedBox(
              height: height * 0.02,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 20),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  "Forgot Password ?",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            GestureDetector(
              onTap: () => checkCredentials(context),
              child: MyButton(
                text: "Sign In",
              ),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Or Continue With ",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Image.asset(
                "lib/assets/google.png",
                width: width * 0.18,
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Not a Member? ",
                  style: TextStyle(color: Colors.white),
                ),
                GestureDetector(onTap: onTap, child: Text("Register Now"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
