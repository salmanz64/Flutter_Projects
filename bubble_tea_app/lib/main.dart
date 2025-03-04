import 'package:bubble_tea_app/auth/authpage.dart';
import 'package:bubble_tea_app/auth/loginorRegister.dart';
import 'package:bubble_tea_app/firebase_options.dart';
import 'package:bubble_tea_app/pages/login_page.dart';
import 'package:bubble_tea_app/pages/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

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
      home: Authpage(),
    );
  }
}
