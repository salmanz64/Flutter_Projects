import 'package:habit_now/models/daySummary.dart';
import 'package:habit_now/models/habit.dart';
import 'package:habit_now/models/habitStatus.dart';
import 'package:hive/hive.dart';

class HiveDatabase {
  final box = Hive.box('habit_database');

  void addHabittoHive(List<HabitStatus> allHabits) {
    List<dynamic> formattedallHabitsList = [];
    for (var habit in allHabits) {
      List<dynamic> singleList = [
        habit.isDone,
        habit.hb.title,
        habit.hb.description,
        habit.hb.category,
        habit.hb.dates,
        habit.hb.time,
      ];
      formattedallHabitsList.add(singleList);
    }
    box.put("AllHabitList", formattedallHabitsList);
  }

  void addDaySummaryToHive(List<Daysummary> overallDaySummary) {
    List<dynamic> formattedallDaySummaryList = [];
    for (var daySummary in overallDaySummary) {
      List<dynamic> singleList = [
        daySummary.date,
        daySummary.h
      ];
      formattedallHabitsList.add(singleList);
    }
    box.put("AllHabitList", formattedallHabitsList);
  }



}
