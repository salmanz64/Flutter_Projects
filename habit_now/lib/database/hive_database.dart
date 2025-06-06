import 'package:habit_now/models/daySummary.dart';
import 'package:habit_now/models/habit.dart';
import 'package:habit_now/models/habitStatus.dart';
import 'package:hive/hive.dart';

class HiveDatabase {
  final box = Hive.box('habit_database');

  //[ [ title,description,category,dates,time,bestStreak,notfid,priority ] ]
  void addHabittoHive(List<Habit> allHabits) {
    List<dynamic> formattedallHabitsList = [];
    for (var habit in allHabits) {
      List<dynamic> singleList = [
        habit.title,
        habit.description,
        habit.category,
        habit.dates,
        habit.time,
        habit.bestStreak,
        habit.notfid,
        habit.priority,
      ];
      formattedallHabitsList.add(singleList);
    }

    box.put("AllHabitList", formattedallHabitsList);
  }

  void addDaySummaryToHive(List<Daysummary> overallDaySummary) {
    List<dynamic> formattedallDaySummaryList = [];
    //[ [2024,[ [isDone,[habit,habit,ashf,...] ] ]
    for (var daySummary in overallDaySummary) {
      List<dynamic> dayHabits = [];
      for (int i = 0; i < daySummary.habits.length; i++) {
        List<dynamic> singleList = [
          daySummary.habits[i].hb.title,
          daySummary.habits[i].hb.description,
          daySummary.habits[i].hb.category,
          daySummary.habits[i].hb.dates,
          daySummary.habits[i].hb.time,
          daySummary.habits[i].hb.bestStreak,
          daySummary.habits[i].hb.notfid,
          daySummary.habits[i].hb.priority,
        ];

        dayHabits.add([daySummary.habits[i].isDone, singleList]);
      }
      List<dynamic> singleList = [daySummary.date, dayHabits];
      formattedallDaySummaryList.add(singleList);
    }

    box.put("AllDaySummary", formattedallDaySummaryList);
  }

  List<Habit> getHabits() {
    List convertedList = box.get("AllHabitList") ?? [];

    List<Habit> originalList = [];

    for (int i = 0; i < convertedList.length; i++) {
      Habit hb = Habit(
        category: convertedList[i][2],
        title: convertedList[i][0],
        description: convertedList[i][1],
        dates: convertedList[i][3],
        time: convertedList[i][4],
        bestStreak: convertedList[i][5],
        notfid: convertedList[i][6],
        priority: convertedList[i][7],
      );
      originalList.add(hb);
    }
    return originalList;
  }

  List<Daysummary> getDaySummary() {
    List convertedList = box.get("AllDaySummary") ?? [];

    List<Daysummary> originalList = [];

    for (int i = 0; i < convertedList.length; i++) {
      String date = convertedList[i][0];
      List habitsStatus = convertedList[i][1];
      List<HabitStatus> singleList = [];
      for (int j = 0; j < habitsStatus.length; j++) {
        int habitStatus = habitsStatus[j][0];

        singleList.add(
          HabitStatus(
            hb: Habit(
              category: habitsStatus[j][1][2],
              title: habitsStatus[j][1][0],
              description: habitsStatus[j][1][1],
              dates: habitsStatus[j][1][3],
              time: habitsStatus[j][1][4],
              bestStreak: habitsStatus[j][1][5],
              notfid: habitsStatus[j][1][6],
              priority: habitsStatus[j][1][7],
            ),
            isDone: habitStatus,
          ),
        );
      }

      originalList.add(Daysummary(habits: singleList, date: date));
    }
    return originalList;
  }
}
