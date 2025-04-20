import 'package:flutter/material.dart';
import 'package:habit_now/models/daySummary.dart';
import 'package:habit_now/models/habit.dart';
import 'package:habit_now/models/habitStatus.dart';
import 'package:habit_now/notification/notification.dart';
import 'package:habit_now/utils/dates.dart';
import 'package:intl/intl.dart';

class HabitData extends ChangeNotifier {
  List<Habit> overallHabits = [];
  List<Daysummary> overallDaySummary = [];

  void addHabit(Habit hb) {
    overallHabits.add(hb);

    if (hb.time != null) {
      int habitId =
          DateTime.now()
              .millisecondsSinceEpoch; // Ensures unique ID based on the current time

      scheduleDailyNotification(
        hb.time!, // The time you want to send the notification (from Habit model)
        habitId, // Unique ID for this habit's notification
        "Habit Reminder", // Title of the notification
        "Don't forget to do: ${hb.title}", // Body of the notification
      );
    }

    doSomeDaySummary();
    notifyListeners();
  }

  void deleteHabit(String name) {
    overallHabits.removeWhere((element) => element.title == name);
    doSomeDaySummary();
    notifyListeners();
  }

  // to check whether the date is the one in the habit
  bool isHabitOnDay(Habit hb, String dayOfWeek) {
    int val = days.indexOf(dayOfWeek);
    return hb.dates[val];
  }

  void doSomeDaySummary() {
    //make sure a preset 15 date summary are created
    for (int j = 0; j < 15; j++) {
      DateTime day = DateTime.now().add(Duration(days: j));
      String convDate = converDateTOString(day);
      String dayOfWeek = DateFormat('E').format(day);

      List<HabitStatus> todayList = [];
      //check whether the habit is already in the daysummary or not if it is then it is added else a habit
      for (var i = 0; i < overallHabits.length; i++) {
        if (isHabitOnDay(overallHabits[i], dayOfWeek)) {
          Habit hb = overallHabits[i];

          int index = overallDaySummary.indexWhere(
            (element) => element.date == convDate,
          );

          int alreadyExists = overallDaySummary[index].habits.indexWhere(
            (element) => element.hb.title == hb.title,
          );

          if (alreadyExists != -1) {
            todayList.add(overallDaySummary[index].habits[alreadyExists]);
          } else {
            todayList.add(HabitStatus.fromHabit(overallHabits[i]));
          }
        }
      }

      //checks whether the date is already there or not if it is then it is discarded with the todaylist habits else a list with new habits
      int index = overallDaySummary.indexWhere(
        (element) => element.date == convDate,
      );
      if (index != -1) {
        overallDaySummary[index].habits = todayList;
      } else {
        Daysummary ds = Daysummary(
          habits: todayList,
          date: converDateTOString(day),
        );
        overallDaySummary.add(ds);
      }
    }
    notifyListeners();
  }

  void updateStatus(String date, String name) {
    overallDaySummary.forEach((element) {
      if (element.date == date) {
        HabitStatus changeElement = element.habits.firstWhere(
          (habit) => habit.hb.title == name,
        );

        changeElement.isDone = (changeElement.isDone + 1) % 3;
      }
    });
    notifyListeners();
  }
}
