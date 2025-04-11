import 'package:flutter/material.dart';
import 'package:habit_now/pages/Add%20Habit/category_page.dart';
import 'package:habit_now/pages/Add%20Habit/habit_detail_page.dart';
import 'package:habit_now/pages/page_navigator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: TextTheme()),
      home: HabitDetailPage(),
    );
  }
}
