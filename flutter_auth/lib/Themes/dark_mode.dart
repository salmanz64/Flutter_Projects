import 'package:flutter/material.dart';

ThemeData darktMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
        surface: Colors.grey.shade900,
        primary: Colors.grey.shade800,
        secondary: Colors.grey.shade700,
        inversePrimary: Colors.grey.shade300),
    textTheme: ThemeData.light()
        .textTheme
        .apply(bodyColor: Colors.grey[300], displayColor: Colors.white));
