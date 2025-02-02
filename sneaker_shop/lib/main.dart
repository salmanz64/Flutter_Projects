import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop/data/cart.dart';
import 'package:sneaker_shop/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: WelcomeScreen(),
        );
      },
    );
  }
}
