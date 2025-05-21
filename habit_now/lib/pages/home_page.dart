import 'package:flutter/material.dart';
import 'package:habit_now/components/date_tile.dart';
import 'package:habit_now/components/habit_tile.dart';
import 'package:habit_now/database/habit_data.dart';
import 'package:habit_now/models/habitStatus.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime date = DateTime.now();

  late String selectedDay;
  @override
  void initState() {
    selectedDay = DateFormat('E').format(date);
    Provider.of<HabitData>(context, listen: false).checkDelays();

    Provider.of<HabitData>(context, listen: false).doSomeDaySummary();
    super.initState();
  }

  int selectedIndex = 0;

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
                    color: Theme.of(context).colorScheme.tertiary,
                    dayOfMonth: dayOfMonth,
                    dayOfWeek: dayOfWeek,
                    isActive: index == selectedIndex,
                    width: width * 0.13,
                    height: height * 0.07,
                  ),
                );
              },
              itemCount: 15,
              scrollDirection: Axis.horizontal,
            ),
          ),
          SizedBox(height: height * 0.02),
          SizedBox(
            height: height,
            child: Consumer<HabitData>(
              builder: (context, value, child) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount:
                      selectedIndex < value.filteredDaySummary.length
                          ? value
                              .filteredDaySummary[selectedIndex]
                              .habits
                              .length
                          : 0,
                  itemBuilder: (context, index) {
                    HabitStatus element =
                        value.filteredDaySummary[selectedIndex].habits[index];

                    return HabitTile(
                      hbs: element,
                      date: value.filteredDaySummary[selectedIndex].date,
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
