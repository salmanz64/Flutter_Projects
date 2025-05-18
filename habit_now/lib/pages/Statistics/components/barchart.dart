import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:habit_now/database/habit_data.dart';
import 'package:habit_now/models/habit.dart';
import 'package:provider/provider.dart';

class Barchart extends StatelessWidget {
  Habit? hb;
  Barchart({super.key, required this.hb});

  @override
  Widget build(BuildContext context) {
    Map data = Provider.of<HabitData>(context, listen: false).barGraph(hb!);

    return SizedBox(
      height: 200,
      width: double.infinity,
      child: BarChart(
        BarChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  const months = [
                    'Jan',
                    'Feb',
                    'Mar',
                    'Apr',
                    'May',
                    'Jun',
                    'Jul',
                    'Aug',
                    'Sep',
                    'Oct',
                    'Nov',
                    'Dec',
                  ];
                  String text =
                      value.toInt() >= 0 && value.toInt() < months.length
                          ? months[value.toInt()]
                          : "";
                  return Text(text, style: TextStyle(color: Colors.white));
                },
              ),
            ),
          ),

          barTouchData: BarTouchData(enabled: false),
          barGroups:
              data.entries.toList().asMap().entries.map((e) {
                int index = e.key;

                return BarChartGroupData(
                  x: index,

                  barRods: [BarChartRodData(toY: e.value.value.toDouble())],
                );
              }).toList(),
        ),
      ),
    );
  }
}
