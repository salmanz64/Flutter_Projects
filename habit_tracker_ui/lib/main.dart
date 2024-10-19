import 'package:flutter/material.dart';
import 'package:habit_tracker_ui/pages/firstpage.dart';
import 'package:habit_tracker_ui/pages/homepage.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}
