import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:habit_now/models/daySummary.dart';
import 'package:habit_now/models/habit.dart';
import 'package:habit_now/models/habitStatus.dart';
import 'package:habit_now/notification/notify_service.dart';
import 'package:habit_now/utils/dates.dart';
import 'package:intl/intl.dart';

class HabitData extends ChangeNotifier {
  List<Habit> overallHabits = [];
  List<Daysummary> overallDaySummary = [];
  List<Daysummary> filteredDaySummary = [];
  List<Daysummary> fifteenDaySummary = [];

  void addHabit(Habit hb) {
    overallHabits.add(hb);

    if (hb.time != null) {
      ShowLocalNotification().scheduleNotification(
        hb.title,
        "It's Time for ${hb.title} Buckle Up",
        hb.time!.hour,
        hb.time!.minute,
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

  void checkDelays() {
    for (int i = 0; i < overallDaySummary.length; i++) {
      String dateString = overallDaySummary[i].date;

      int year = int.parse(dateString.substring(0, 4));
      int month = int.parse(dateString.substring(4, 6));
      int day = int.parse(dateString.substring(6, 8));

      DateTime date = DateTime(year, month, day);
      DateTime today = DateTime.now();

      // Remove time part for accurate comparison
      DateTime onlyToday = DateTime(today.year, today.month, today.day);

      if (date.isBefore(onlyToday)) {
        for (int j = 0; j < overallDaySummary[i].habits.length; j++) {
          if (overallDaySummary[i].habits[j].isDone == 0) {
            overallDaySummary[i].habits[j].isDone = 3;
          }
        }
      }
    }
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
          if (index != -1) {
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
      }

      //checks whether the date is already there or not if it is then it is discarded with the todaylist habits else a list with new habits
      int index = overallDaySummary.indexWhere(
        (element) => element.date == convDate,
      );
      if (index != -1) {
        overallDaySummary[index].habits = todayList;
      } else {
        Daysummary ds = Daysummary(habits: [], date: converDateTOString(day));
        overallDaySummary.add(ds);
      }
    }
    dofifteenDaysSummary();
  }

  void dofifteenDaysSummary() {
    fifteenDaySummary.clear();
    for (int i = 0; i < overallDaySummary.length; i++) {
      String dateString = overallDaySummary[i].date;

      int year = int.parse(dateString.substring(0, 4));
      int month = int.parse(dateString.substring(4, 6));
      int day = int.parse(dateString.substring(6, 8));

      DateTime date = DateTime(year, month, day);
      DateTime today = DateTime.now();

      // Remove time part for accurate comparison
      DateTime onlyToday = DateTime(today.year, today.month, today.day);
      if (date.isAfter(onlyToday) ||
          (date.year == onlyToday.year &&
              date.month == onlyToday.month &&
              date.day == onlyToday.day)) {
        fifteenDaySummary.add(overallDaySummary[i]);
      }
    }

    //we need a copy of overallDaysummary so it should not be referenced to the same object so List.from()is used
    filteredDaySummary =
        fifteenDaySummary
            .map((e) => Daysummary(habits: List.from(e.habits), date: e.date))
            .toList();
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

  void filterHabit(String query) {
    for (int i = 0; i < overallDaySummary.length; i++) {
      filteredDaySummary[i].habits =
          fifteenDaySummary[i].habits
              .where(
                (val) =>
                    val.hb.title.toLowerCase().contains(query.toLowerCase()),
              )
              .toList();
    }
    notifyListeners();
  }

  List<int> findHabitStatuses(Habit hb) {
    List<int> isDone = [];
    DateTime date = DateTime.now().subtract(Duration(days: 2));

    for (int i = 0; i < 7; i++) {
      int found = 0;
      DateTime newdate = date.add(Duration(days: i));
      String formattedDate = converDateTOString(newdate);
      HabitStatus? targetHabit;
      for (int j = 0; j < overallDaySummary.length; j++) {
        if (overallDaySummary[j].date == formattedDate) {
          try {
            targetHabit = overallDaySummary[j].habits.firstWhere(
              (element) => hb.title == element.hb.title,
            );
          } catch (e) {
            targetHabit = null;
          }
          if (targetHabit != null) {
            isDone.add(targetHabit.isDone);
            found = 1;
          }
        }
      }
      if (found == 0) {
        isDone.add(0);
      }
    }

    return isDone;
  }

  int findStreak(Habit hb) {
    int streak = 0;
    HabitStatus? targethb;
    for (int i = 0; i < overallDaySummary.length; i++) {
      try {
        targethb = overallDaySummary[i].habits.firstWhere(
          (element) => element.hb.title == hb.title,
        );
      } catch (e) {
        continue;
      }
      if (targethb.isDone == 1) {
        streak += 1;
      } else if (targethb.isDone == 2) {
        streak = 0;
      }
    }
    if (streak > hb.bestStreak) {
      hb.bestStreak = streak;
    }
    return streak;
  }

  //to find the completion by looking through every overallday summary and check if the habit is there
  // if not it will continue else the total and completed will be added accordingly
  int findCompletion(Habit hb) {
    int totalNumber = 0;
    int completed = 0;

    HabitStatus? targethb;
    for (int i = 0; i <= overallDaySummary.length; i++) {
      try {
        targethb = overallDaySummary[i].habits.firstWhere(
          (element) => element.hb.title == hb.title,
        );
      } catch (e) {
        continue;
      }
      if (targethb.isDone == 1 || (targethb.isDone == 2)) {
        totalNumber++;
      }
      if (targethb.isDone == 1) {
        completed++;
      }
    }
    if (completed == 0) {
      return 0;
    } else {
      return ((completed / totalNumber) * 100).toInt();
    }
  }

  Map<DateTime, int> heatMap(Habit hb) {
    Map<DateTime, int> dates = {};
    Habit targetHabit = overallHabits.firstWhere(
      (habit) => habit.title == hb.title,
    );

    for (int i = 0; i < overallDaySummary.length; i++) {
      for (int j = 0; j < overallDaySummary[i].habits.length; j++) {
        if (overallDaySummary[i].habits[j].hb.title == targetHabit.title) {
          String dateString = overallDaySummary[i].date;
          int year = int.parse(dateString.substring(0, 4));
          int month = int.parse(dateString.substring(4, 6));
          int day = int.parse(dateString.substring(6, 8));

          DateTime date = DateTime(year, month, day);
          dates[date] = overallDaySummary[i].habits[j].isDone;
        }
      }
    }

    return dates;
  }

  //TO find the times completed
  Map findTimesCompleted(Habit hb) {
    Map timesCompleted = {'week': 0, 'month': 0, 'year': 0, 'all': 0};

    DateTime today = DateTime.now();
    DateTime thisWeek = DateTime(
      today.year,
      today.month,
      today.day,
    ).subtract(Duration(days: today.weekday - 1));
    for (int i = 0; i < overallDaySummary.length; i++) {
      HabitStatus? isFound;
      try {
        isFound = overallDaySummary[i].habits.firstWhere(
          (element) => element.hb.title == hb.title,
        );
      } catch (e) {
        isFound = null;
      }
      if (isFound != null && isFound.isDone == 1) {
        DateTime date = convertStringToDate(overallDaySummary[i].date);
        DateTime startOfTheWeek = DateTime(
          date.year,
          date.month,
          date.day,
        ).subtract(Duration(days: date.weekday - 1));

        if (thisWeek.isAtSameMomentAs(startOfTheWeek)) {
          timesCompleted['week'] += 1;
        }
        if (date.month == today.month) {
          timesCompleted['month'] += 1;
        }
        if (date.year == today.year) {
          timesCompleted['year'] += 1;
        }
        timesCompleted['all'] += 1;
      }
    }
    return timesCompleted;
  }

  Map barGraph(Habit hb) {
    Map data = {
      'Jan': 0,
      'Feb': 0,

      'Mar': 0,
      'Apr': 0,
      'May': 0,
      'Jun': 0,
      'Jul': 0,
      'Aug': 0,
      'Sep': 0,
      'Oct': 0,
      'Nov': 0,
      'Dec': 0,
    };

    for (int i = 0; i < overallDaySummary.length; i++) {
      HabitStatus? isFound;
      try {
        isFound = overallDaySummary[i].habits.firstWhere(
          (element) => element.hb.title == hb.title,
        );
      } catch (e) {
        isFound = null;
      }
      if (isFound != null && isFound.isDone == 1) {
        DateTime date = convertStringToDate(overallDaySummary[i].date);

        String monthAbbv = DateFormat('MMM').format(date);
        data[monthAbbv] += 1;
      }
    }

    return data;
  }

  Map pieChartData(Habit hb) {
    Map data = {'green': 0, 'red': 0, 'yellow': 0, 'total': 0};
    for (int i = 0; i < overallDaySummary.length; i++) {
      HabitStatus? isFound;
      try {
        isFound = overallDaySummary[i].habits.firstWhere(
          (element) => element.hb.title == hb.title,
        );
      } catch (e) {
        isFound = null;
      }
      if (isFound != null && isFound.isDone == 1) {
        data['green'] += 1;
      } else if (isFound != null && isFound.isDone == 2) {
        data['red'] += 1;
      } else if (isFound != null && isFound.isDone == 3) {
        data['yellow'] += 1;
      }
    }
    int total = data.values.reduce((value, element) => value + element);
    data['total'] = total;
    if (total == 0) {
      return {'green': 0, 'red': 0, 'yellow': 0, 'total': 0};
    }

    return data;
  }
}
