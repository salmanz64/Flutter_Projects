import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:work_out_app/dateTime/date_time.dart';

class MyHeatMap extends StatelessWidget {
  final Map<DateTime, int>? datasets;
  final String startDateyyyymmdd;
  MyHeatMap(
      {super.key, required this.datasets, required this.startDateyyyymmdd});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: HeatMap(
        startDate: createDateTimeObject(startDateyyyymmdd),
        endDate: DateTime.now().add(const Duration(days: 0)),
        datasets: datasets,
        colorMode: ColorMode.color,
        defaultColor: Colors.grey[200],
        textColor: Colors.white,
        showColorTip: false,
        showText: true,
        scrollable: true,
        size: 30,
        colorsets: const {1: Colors.green},
      ),
    );
  }
}
