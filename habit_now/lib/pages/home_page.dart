import 'package:flutter/material.dart';
import 'package:habit_now/components/date_tile.dart';
import 'package:habit_now/components/habit_tile.dart';
import 'package:habit_now/database/habit_data.dart';
import 'package:habit_now/models/habit.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: height * 0.09,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return DateTile(
                  isActive: index == 2,
                  width: width * 0.13,
                  height: height * 0.07,
                );
              },
              itemCount: 20,
              scrollDirection: Axis.horizontal,
            ),
          ),
          SizedBox(height: height * 0.02),
          SizedBox(
            height: height,
            child: Consumer<HabitData>(
              builder: (context, value, child) {
                return ListView.builder(
                  itemCount: value.overallHabits.length,
                  itemBuilder: (context, index) {
                    Habit element = value.overallHabits[index];
                    return HabitTile(
                      isDone: element.isDone,
                      category: element.category,
                      name: element.title,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
