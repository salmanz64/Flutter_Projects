import 'package:flutter/material.dart';

class SigninOrLogin extends StatelessWidget {
  const SigninOrLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF122D42),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('lib/assets/logo.png'),
              height: 250,
              width: 250,
            ),
            Column(
              children: [
                TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white
                          .withOpacity(0.01), // Set transparency here
                      hintText: 'Email',
                      hintStyle: const TextStyle(
                          color: Colors.white70), // Hint text color
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none, // Remove border
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white
                          .withOpacity(0.01), // Set transparency here
                      hintText: 'Password',
                      hintStyle: const TextStyle(
                          color: Colors.white70), // Hint text color
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none, // Remove border
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        spreadRadius: 0,
                        blurRadius: 20, // Increased blur radius
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                      child: Text(
                    "L O G I N",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text(
                      "Don't  have an account?",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w100),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                        onTap: () {},
                        child: const Text("Sign up",
                            style: TextStyle(color: Colors.white)))
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
