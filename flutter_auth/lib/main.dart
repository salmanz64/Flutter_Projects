import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Themes/dark_mode.dart';
import 'package:flutter_auth/Themes/light_mode.dart';
import 'package:flutter_auth/auth/login_or_register.dart';
import 'package:flutter_auth/firebase_options.dart';
import 'package:flutter_auth/pages/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      darkTheme: darktMode,
      home: LoginOrRegister(),
    );
  }
}
