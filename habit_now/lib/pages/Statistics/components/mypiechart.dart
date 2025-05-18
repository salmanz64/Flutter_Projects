import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:habit_now/database/habit_data.dart';
import 'package:habit_now/models/habit.dart';
import 'package:provider/provider.dart';

class MyPieChart extends StatelessWidget {
  Habit? hb;
  MyPieChart({super.key, required this.hb});

  @override
  Widget build(BuildContext context) {
    Map data = Provider.of<HabitData>(context, listen: false).pieChartData(hb!);
    return PieChart(
      PieChartData(
        centerSpaceRadius: 40,
        sectionsSpace: 4,

        sections: [
          PieChartSectionData(
            color: Color.fromARGB(255, 253, 40, 25),
            radius: 45,
            value: data['total'] != 0 ? (data['red'] / data['total']) * 100 : 0,
            title: data['red'].toString(),
          ),
          PieChartSectionData(
            color: Color.fromARGB(255, 4, 206, 11),
            radius: 45,
            value:
                data['total'] != 0 ? (data['green'] / data['total']) * 100 : 0,
            title: data['green'].toString(),
          ),
          PieChartSectionData(
            color: Colors.yellow,
            radius: 45,
            value:
                data['total'] != 0 ? (data['yellow'] / data['total']) * 100 : 0,
            title: data['yellow'].toString(),
          ),
        ],
      ),
    );
  }
}
