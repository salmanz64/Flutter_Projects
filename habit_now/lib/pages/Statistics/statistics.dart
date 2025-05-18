import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:habit_now/database/habit_data.dart';
import 'package:habit_now/models/habit.dart';
import 'package:habit_now/pages/Statistics/components/barchart.dart';
import 'package:habit_now/pages/Statistics/components/mypiechart.dart';
import 'package:habit_now/pages/Statistics/components/timeCompleted.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class Statistics extends StatelessWidget {
  Habit? hb;
  Statistics({super.key, required this.hb});

  @override
  Widget build(BuildContext context) {
    int percentage = Provider.of<HabitData>(
      context,
      listen: false,
    ).findCompletion(hb!);
    int streak = Provider.of<HabitData>(context, listen: false).findStreak(hb!);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(Icons.wb_incandescent),
                  Spacer(),
                  Text("Habit Score", style: TextStyle(fontSize: 18)),
                  Spacer(),
                ],
              ),
            ),
            SizedBox(height: 20),
            CircularPercentIndicator(
              animateToInitialPercent: true,
              animation: true,
              animateFromLastPercent: true,
              animationDuration: 1500,
              backgroundColor: const Color.fromARGB(255, 52, 52, 52),

              radius: 70,
              percent: percentage / 100,
              lineWidth: 15,
              center: Text(
                percentage.toString(),
                style: TextStyle(fontSize: 30),
              ),
              progressColor: Colors.blue,
            ),

            SizedBox(height: 30),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Icon(Icons.ssid_chart_outlined),
                      Spacer(),
                      Text("Streak", style: TextStyle(fontSize: 22)),
                      Spacer(),
                    ],
                  ),
                ),

                Row(
                  children: [
                    Spacer(),
                    Column(
                      children: [
                        Text("Current", style: TextStyle(fontSize: 20)),
                        Text(
                          "$streak Days",
                          style: TextStyle(color: Colors.blue, fontSize: 20),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Text("Best", style: TextStyle(fontSize: 20)),
                        Text(
                          "${hb!.bestStreak} Days",
                          style: TextStyle(color: Colors.blue, fontSize: 20),
                        ),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
                SizedBox(height: 20),
                Timecompleted(hb: hb!),
              ],
            ),

            //bar chart
            Barchart(hb: hb),

            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Icon(Icons.pie_chart_outline),
                      Spacer(),
                      Text("Success / Fail", style: TextStyle(fontSize: 22)),
                      Spacer(),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 200, child: MyPieChart(hb: hb)),
          ],
        ),
      ),
    );
  }
}
