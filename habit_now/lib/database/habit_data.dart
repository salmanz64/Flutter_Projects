import 'package:flutter/material.dart';
import 'package:habit_now/models/habit.dart';

class HabitData extends ChangeNotifier {
  List<Habit> overallHabits = [];

  void addHabit(Habit hb) {
    overallHabits.add(hb);
    notifyListeners();
  }

  void deleteHabit(String name) {
    overallHabits.removeWhere((element) => element.title == name);
    notifyListeners();
  }
}
