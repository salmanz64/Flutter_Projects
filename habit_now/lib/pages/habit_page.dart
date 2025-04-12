import 'package:flutter/material.dart';
import 'package:habit_now/components/habit_details.dart';
import 'package:habit_now/database/habit_data.dart';
import 'package:habit_now/models/habit.dart';
import 'package:provider/provider.dart';

class HabitPage extends StatelessWidget {
  HabitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Consumer<HabitData>(
            builder: (context, value, child) {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: value.overallHabits.length,
                itemBuilder: (context, index) {
                  Habit element = value.overallHabits[index];

                  return HabitDetails(
                    category: element.category,
                    name: element.title,
                    isDone: element.isDone,
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
