import 'package:auth_test/components/displayError.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  final void Function()? onTap;
  SignUpPage({super.key, required this.onTap});

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController cfPass = TextEditingController();

  void registerUser(context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );

    if (pass.text != cfPass.text || pass.text.isEmpty || email.text.isEmpty) {
      Navigator.of(context).pop();
      displayErrorMessage("Not Match", context);
      return;
    }
    try {
      UserCredential? userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.text, password: pass.text);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      displayErrorMessage(e.code, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Image.asset(
                'lib/assets/child_2.png',
                alignment: Alignment.center,
                width: screenWidth - 160,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: screenHeight * 0.03,
                      ),
                      Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: screenHeight * 0.03,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.alternate_email,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: screenWidth * 0.03,
                          ),
                          Expanded(
                              child: TextField(
                            controller: email,
                            decoration: InputDecoration(hintText: "Email ID"),
                          ))
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.015,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.password_rounded,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: screenWidth * 0.03,
                          ),
                          Expanded(
                              child: TextField(
                            controller: pass,
                            decoration: InputDecoration(hintText: "Password"),
                          ))
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.password,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: screenWidth * 0.03,
                          ),
                          Expanded(
                              child: TextField(
                            controller: cfPass,
                            decoration:
                                InputDecoration(hintText: "Confirm Password"),
                          ))
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.04,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: "By Signing Up you are agreeing to our ",
                                style: TextStyle(color: Colors.grey)),
                            TextSpan(
                                text: "Terms and Conditions ",
                                style: TextStyle(color: Colors.blue)),
                            TextSpan(
                                text: "And ",
                                style: TextStyle(color: Colors.grey)),
                            TextSpan(
                                text: "Privacy Policy",
                                style: TextStyle(color: Colors.blue))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.04,
                      ),
                      GestureDetector(
                        onTap: () => registerUser(context),
                        child: Container(
                          height: 60,
                          width: double.infinity - 100,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                              child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Joined Us before? "),
                          GestureDetector(
                            onTap: onTap,
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
