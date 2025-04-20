import 'package:habit_now/models/habit.dart';

class HabitStatus {
  final Habit hb;
  int isDone;

  HabitStatus({required this.hb, this.isDone = 0});

  factory HabitStatus.fromHabit(Habit hb) {
    return HabitStatus(hb: hb);
  }
}
