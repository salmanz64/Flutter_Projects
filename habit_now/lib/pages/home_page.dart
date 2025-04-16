import 'package:flutter/material.dart';
import 'package:habit_now/components/date_tile.dart';
import 'package:habit_now/components/habit_tile.dart';
import 'package:habit_now/database/habit_data.dart';
import 'package:habit_now/models/habit.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime date = DateTime.now().subtract(Duration(days: 2));

  late String selectedDay;
  @override
  void initState() {
    // TODO: implement initState
    selectedDay = DateFormat('d').format(date);
    super.initState();
  }

  int selectedIndex = 2;

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
                DateTime days = date.add(Duration(days: index));
                String dayOfWeek = DateFormat('E').format(days);
                String dayOfMonth = DateFormat('d').format(days);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                      selectedDay = dayOfWeek;
                    });
                  },
                  child: DateTile(
                    dayOfMonth: dayOfMonth,
                    dayOfWeek: dayOfWeek,
                    isActive: index == selectedIndex,
                    width: width * 0.13,
                    height: height * 0.07,
                  ),
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
                    if (value.getDate(element, selectedDay)) {
                      return HabitTile(
                        isDone: element.isDone,
                        category: element.category,
                        name: element.title,
                      );
                    }
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
