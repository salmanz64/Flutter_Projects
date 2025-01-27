import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:work_out_app/models/workout_data.dart';
import 'package:work_out_app/screens/home_screen.dart';
import 'package:work_out_app/screens/welcome_screen.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('workout_data');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WorkoutData(),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: WelcomeScreen(),
        );
      },
    );
  }
}
