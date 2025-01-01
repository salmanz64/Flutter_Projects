import 'dart:async';

import 'package:flutter/material.dart';
import 'package:habit_tracker/util/habit_card.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //dummy files [habitname, ishabitplay,timespent,timegoal]
  List habits = [
    ["Exercise", false, 0, 50],
    ["Running", false, 0, 30]
  ];

  void startHabit(int index) {
    // Note the time at start

    var startTime = DateTime.now();

    //change the state of play
    setState(() {
      habits[index][1] = !habits[index][1];
    });

    var elapsedTime = habits[index][2];
    var timeGoal = habits[index][3];

    //if play then start timer and substract current time with start time
    if (habits[index][1] && elapsedTime < timeGoal) {
      Timer.periodic(
        const Duration(seconds: 1),
        (timer) {
          setState(() {
            if (!habits[index][1]) {
              timer.cancel();
              return;
            }
            if (habits[index][2] >= timeGoal) {
              habits[index][1] = false;
              return;
            }

            var currentTime = DateTime.now();
            habits[index][2] = elapsedTime +
                currentTime.second -
                startTime.second +
                60 * (currentTime.minute - startTime.minute) +
                3600 * (currentTime.hour - startTime.hour);
          });
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text("Habit Tracker"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
          padding: EdgeInsets.all(16),
          child: ListView.builder(
            itemBuilder: (context, index) => HabitCard(
              onTap: () {
                startHabit(index);
              },
              habitName: habits[index][0],
              isStarted: habits[index][1],
              timeSpent: habits[index][2],
              timeGoal: habits[index][3],
            ),
            itemCount: habits.length,
          )),
    );
  }
}
