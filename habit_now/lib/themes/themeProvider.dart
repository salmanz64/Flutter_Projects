import 'package:flutter/material.dart';
import 'package:habit_now/themes/theme.dart';

class Themeprovider extends ChangeNotifier {
  ThemeData _themeData = darkMode;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == darkMode) {
      _themeData = lightmode;
    } else {
      _themeData = darkMode;
    }
    notifyListeners();
  }
}
