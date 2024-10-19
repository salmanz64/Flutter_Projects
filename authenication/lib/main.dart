import 'package:authenication/auth/auth.dart';
import 'package:authenication/auth/login_or_register.dart';
import 'package:authenication/firebase_options.dart';
import 'package:authenication/pages/home_page.dart';
import 'package:authenication/pages/profile_page.dart';
import 'package:authenication/pages/users_page.dart';
import 'package:authenication/theme/dark_mode.dart';
import 'package:authenication/theme/light_mode.dart';
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
      home: const AuthPage(),
      theme: lightMode,
      darkTheme: darkMode,
      routes: {
        '/login_register': (context) => const LoginOrRegister(),
        '/home_page': (context) => HomePage(),
        '/profile_page': (context) => ProfilePage(),
        '/users_page': (context) => const UsersPage(),
      },
    );
  }
}
