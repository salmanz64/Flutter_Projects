import 'package:authenication/components/my_button.dart';
import 'package:authenication/components/text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final password = TextEditingController();

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
            MyButton(onTap: () {}, text: "Login"),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Dont have an account?",
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
