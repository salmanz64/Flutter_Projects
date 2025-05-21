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
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.surface,
          title: Text(
            hb!.title,
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          actions: [Padding(padding: const EdgeInsets.all(8.0), child: icon)],
          //to place the tab bar just beneath the app bar we use bottom
          bottom: TabBar(
            labelColor: Theme.of(context).colorScheme.secondary,

            indicatorColor: Theme.of(context).colorScheme.secondary,

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
