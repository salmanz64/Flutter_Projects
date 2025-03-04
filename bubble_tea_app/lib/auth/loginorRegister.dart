import 'package:bubble_tea_app/pages/login_page.dart';
import 'package:bubble_tea_app/pages/register_page.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Loginorregister extends StatefulWidget {
  Loginorregister({
    super.key,
  });

  @override
  State<Loginorregister> createState() => _LoginorregisterState();
}

class _LoginorregisterState extends State<Loginorregister> {
  bool isLogin = true;

  void toggleLogin() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLogin) {
      return LoginPage(
        onTap: toggleLogin,
      );
    } else {
      return RegisterPage(
        onTap: toggleLogin,
      );
    }
  }
}
