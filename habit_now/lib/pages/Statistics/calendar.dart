import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:habit_now/database/habit_data.dart';
import 'package:habit_now/models/habit.dart';
import 'package:provider/provider.dart';

class CalendarPage extends StatefulWidget {
  Habit? hb;
  Map<DateTime, int>? dates;
  CalendarPage({super.key, required this.hb});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  int? streak;
  @override
  void initState() {
    widget.dates = Provider.of<HabitData>(
      context,
      listen: false,
    ).heatMap(widget.hb!);
    streak = Provider.of<HabitData>(
      context,
      listen: false,
    ).findStreak(widget.hb!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //disallows all user interactions
        HeatMapCalendar(
          defaultColor: Theme.of(context).colorScheme.surface,

          colorsets: {
            0: Theme.of(context).colorScheme.surface,
            1: const Color.fromARGB(255, 57, 249, 64),
            2: const Color.fromARGB(255, 253, 40, 25),
            3: Colors.yellow,
          },
          textColor: Theme.of(context).colorScheme.primary,
          datasets: widget.dates,
          showColorTip: false,

          colorMode: ColorMode.color,
        ),
        SizedBox(height: 20),

        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.line_axis,
                    color: Theme.of(context).colorScheme.secondary,
                    size: 30,
                  ),
                  Spacer(),

                  Text("Streak", style: TextStyle(fontSize: 22)),
                  Spacer(),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              "$streak  Days",
              style: TextStyle(
                fontSize: 25,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
