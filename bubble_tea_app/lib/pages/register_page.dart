import 'package:bubble_tea_app/auth/auth_service.dart';
import 'package:bubble_tea_app/components/alert_message.dart';
import 'package:bubble_tea_app/components/my_button.dart';
import 'package:bubble_tea_app/components/my_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final void Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController cfpass = TextEditingController();
  final auth = AuthService();

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
    } else if (pass.text != cfpass.text) {
      Navigator.pop(context);
      displayErrorMessage(context, "Password does not match");
    } else {
      auth.registerEmailAndPassword(context, email.text, pass.text);
    }
  }

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
              'lib/assets/bubble_tea_2.png',
              width: width * 0.7,
            ),
            Text(
              "Boba Is Life",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: height * 0.07,
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
            MyTextfield(
              controller: cfpass,
              hintText: "Confirm Password",
            ),
            SizedBox(
              height: height * 0.06,
            ),
            GestureDetector(
              onTap: () => checkCredentials(context),
              child: MyButton(
                text: "Register",
              ),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Already have an Account? ",
                  style: TextStyle(color: Colors.white),
                ),
                GestureDetector(onTap: onTap, child: Text("Login"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
