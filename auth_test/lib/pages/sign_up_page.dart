import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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
                'lib/assets/child_1.png',
                alignment: Alignment.center,
                width: screenWidth - 100,
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
                        "Login",
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
                          Expanded(child: TextField())
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
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
                            decoration: InputDecoration(hintText: "Email ID"),
                          ))
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
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
                        height: screenHeight * 0.03,
                      ),
                      Container(
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
                      SizedBox(
                        height: 20,
                      ),
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
