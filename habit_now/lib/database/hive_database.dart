import 'package:habit_now/models/daySummary.dart';
import 'package:habit_now/models/habit.dart';
import 'package:habit_now/models/habitStatus.dart';
import 'package:hive/hive.dart';

class HiveDatabase {
  final box = Hive.box('habit_database');

  //[ [ title,description,category,dates,time ] ]
  void addHabittoHive(List<Habit> allHabits) {
    List<dynamic> formattedallHabitsList = [];
    for (var habit in allHabits) {
      List<dynamic> singleList = [
        habit.title,
        habit.description,
        habit.category,
        habit.dates,
        habit.time,
      ];
      formattedallHabitsList.add(singleList);
    }
    box.put("AllHabitList", formattedallHabitsList);
  }

  void addDaySummaryToHive(List<Daysummary> overallDaySummary) {
    List<dynamic> formattedallDaySummaryList = [];
    //[ [2024,[ isDone,[habit,habit,ashf,...] ] ]
    for (var daySummary in overallDaySummary) {
      List<dynamic> dayHabits = [];
      for (int i = 0; i < daySummary.habits.length; i++) {
        List<dynamic> singleList = [
          daySummary.habits[i].hb.title,
          daySummary.habits[i].hb.description,
          daySummary.habits[i].hb.category,
          daySummary.habits[i].hb.dates,
          daySummary.habits[i].hb.time,
        ];

        dayHabits.add([daySummary.habits[i].isDone, singleList]);
      }
      List<dynamic> singleList = [daySummary.date, dayHabits];
      formattedallDaySummaryList.add(singleList);
    }
    box.put("AllDaySummary", formattedallDaySummaryList);
  }

  List getHabits() {
    List convertedList = box.get("AllHabitList") ?? [];

    List<Habit> originalList = [];

    for (int i = 0; i < convertedList.length; i++) {
      Habit hb = Habit(
        category: convertedList[i][2],
        title: convertedList[i][0],
        description: convertedList[i][1],
        dates: convertedList[i][3],
        time: convertedList[i][4],
      );
      originalList.add(hb);
    }
    return originalList;
  }

  List getDaySummary() {
    List convertedList = box.get("AllDaySummary") ?? [];

    List<Daysummary> originalList = [];

    for (int i = 0; i < convertedList.length; i++) {
      List habits = convertedList[i][1];
      List<HabitStatus> singleList = [];
      for (int j = 0; j < habits.length; j++) {
        Habit hb = Habit(
          category: habits[j][2],
          title: habits[j][0],
          description: habits[j][1],
          dates: habits[j][3],
          time: habits[j][4],
        );

        singleList.add(HabitStatus(hb: hb, isDone:habits[j][0]));
      }
      originalList.add(
        Daysummary(habits: singleList, date: convertedList[i][0]),
      );
    }
    return originalList;
  }
}
