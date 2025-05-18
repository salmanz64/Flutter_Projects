import 'package:flutter/material.dart';
import 'package:habit_now/database/habit_data.dart';
import 'package:habit_now/models/habit.dart';
import 'package:provider/provider.dart';

class Timecompleted extends StatelessWidget {
  Habit hb;
  Timecompleted({super.key, required this.hb});

  @override
  Widget build(BuildContext context) {
    Map data = Provider.of<HabitData>(
      context,
      listen: false,
    ).findTimesCompleted(hb);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(Icons.done),
              Spacer(),
              Text("Times Completed", style: TextStyle(fontSize: 18)),
              Spacer(),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("This week"), Text(data['week'].toString())],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("This month"), Text(data['month'].toString())],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("This year"), Text(data['year'].toString())],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("All"), Text(data['all'].toString())],
          ),
        ),
      ],
    );
  }
}
