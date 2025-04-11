import 'package:habit_now/models/habit.dart';

class HabitData {
  List<Habit> overallHabits = [];

  void addHabit(Habit hb) {
    overallHabits.add(hb);
  }
}
