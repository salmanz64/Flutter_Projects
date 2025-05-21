import 'package:flutter/material.dart';

ThemeData lightmode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.white,
    primary: Colors.black,
    secondary: Colors.blue,
    tertiary: Colors.grey.shade300,
    primaryContainer: const Color.fromARGB(255, 155, 153, 153),
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Colors.black,
    primary: Colors.white,
    secondary: Colors.blue,
    tertiary: Colors.black87,
    primaryContainer: Colors.white24,
  ),
);
