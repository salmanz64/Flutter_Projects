import 'package:flutter/material.dart';
import 'package:habit_now/database/habit_data.dart';
import 'package:habit_now/themes/theme.dart';
import 'package:habit_now/themes/themeProvider.dart';
import 'package:timezone/data/latest_all.dart' as tz_data;
import 'package:habit_now/pages/page_navigator.dart';
import 'package:provider/provider.dart';

void main() async {
  tz_data.initializeTimeZones();

  runApp(MyApp());

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HabitData()),
        ChangeNotifierProvider(create: (context) => Themeprovider()),
      ],

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
      darkTheme: darkMode,

      theme: Provider.of<Themeprovider>(context).themeData,

      home: PageNavigator(),
    );
  }
}
