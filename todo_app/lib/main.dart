import 'package:flutter/material.dart';
import 'package:todo_app/Pages/home_screen.dart';
import 'package:todo_app/Pages/signin_or_login.dart';
import 'package:todo_app/Pages/welcome_Page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SigninOrLogin(),
    );
  }
}
