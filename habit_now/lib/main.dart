import 'package:flutter/material.dart';
import 'package:habit_now/database/habit_data.dart';
import 'package:timezone/data/latest_all.dart' as tz_data;
import 'package:habit_now/pages/page_navigator.dart';
import 'package:provider/provider.dart';
import 'package:timezone/timezone.dart' as tz;

void main() async {
  tz_data.initializeTimeZones();

  runApp(MyApp());

  runApp(
    ChangeNotifierProvider(
      create: (context) => HabitData(),
      builder: (context, child) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        iconTheme: IconThemeData(color: Colors.blue),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          bodySmall: TextStyle(color: Colors.white),
          displayLarge: TextStyle(color: Colors.white),
          displayMedium: TextStyle(color: Colors.white),
          displaySmall: TextStyle(color: Colors.white),
          headlineLarge: TextStyle(color: Colors.white),
          headlineMedium: TextStyle(color: Colors.white),
          titleLarge: TextStyle(color: Colors.white),
          titleMedium: TextStyle(color: Colors.white),
          titleSmall: TextStyle(color: Colors.white),
        ),
      ),
      home: PageNavigator(),
    );
  }
}
