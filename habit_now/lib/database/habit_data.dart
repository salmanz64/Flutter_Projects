import 'package:flutter/material.dart';
import 'package:habit_now/models/habit.dart';
import 'package:habit_now/utils/dates.dart';

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

  bool getDate(Habit hb, String dayOfWeek) {
    int val = days.indexOf(dayOfWeek);
    return hb.dates[val];
  }
}
