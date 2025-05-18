import 'package:flutter/material.dart';
import 'package:habit_now/models/habit.dart';
import 'package:habit_now/pages/Statistics/calendar.dart';
import 'package:habit_now/pages/Statistics/statistics.dart';

class StatisticsPage extends StatelessWidget {
  Habit? hb;
  Color? color;
  Icon? icon;
  StatisticsPage({
    super.key,
    required this.hb,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,

      animationDuration: Duration(seconds: 1),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(hb!.title, style: TextStyle(color: Colors.white)),
          actions: [Padding(padding: const EdgeInsets.all(8.0), child: icon)],
          //to place the tab bar just beneath the app bar we use bottom
          bottom: TabBar(
            labelColor: Colors.white,
            tabs: [
              Tab(child: Text("Calendar")),
              Tab(child: Text("Statistics")),
            ],
          ),
        ),
        body: TabBarView(children: [CalendarPage(hb: hb), Statistics(hb: hb)]),
      ),
    );
  }
}
