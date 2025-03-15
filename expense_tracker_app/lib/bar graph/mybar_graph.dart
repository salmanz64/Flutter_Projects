import 'package:expense_tracker_app/bar%20graph/bar_data.dart';
import 'package:fl_chart/fl_chart.dart';

import 'package:flutter/material.dart';

class MybarGraph extends StatelessWidget {
  final double? maxY;
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thurAmount;
  final double friAmount;
  final double satAmount;

  MybarGraph({
    super.key,
    required this.maxY,
    required this.sunAmount,
    required this.monAmount,
    required this.tueAmount,
    required this.wedAmount,
    required this.thurAmount,
    required this.friAmount,
    required this.satAmount,
  });

  @override
  Widget build(BuildContext context) {
    BarData bData = BarData(
      sunAmount: sunAmount,
      monAmount: monAmount,
      tueAmount: tueAmount,
      wedAmount: wedAmount,
      thurAmount: thurAmount,
      friAmount: friAmount,
      satAmount: satAmount,
    );

    bData.initializeBar();

    //the package is used here and the bardata is then mapped to convert to barcharGroupData with x and y from dara
    return BarChart(
      BarChartData(
        maxY: maxY,
        minY: 0,
        // the numeric value in x and y axis
        titlesData: FlTitlesData(
          show: true,
          // turn off the display of top values
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          //same off the left
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: getBottomTiles,
            ),
          ),
        ),
        //must needed tho i dont know why
        gridData: FlGridData(show: false),
        //turns the border to off
        borderData: FlBorderData(show: false),
        barGroups:
            bData.barData
                .map(
                  (data) => BarChartGroupData(
                    x: data.x,
                    barRods: [
                      BarChartRodData(
                        toY: data.y,
                        color: Colors.grey[800],
                        width: 25,
                        borderRadius: BorderRadius.circular(4),
                        backDrawRodData: BackgroundBarChartRodData(
                          show: true,
                          toY: maxY,
                          // the background color of the individual chart
                          color: Colors.grey[200],
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
      ),
    );
  }
}

Widget getBottomTiles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = Text('S', style: style);
      break;
    case 1:
      text = Text('M', style: style);
      break;
    case 2:
      text = Text('T', style: style);
      break;
    case 3:
      text = Text('W', style: style);
      break;
    case 4:
      text = Text('T', style: style);
      break;
    case 5:
      text = Text('F', style: style);
      break;
    case 6:
      text = Text('S', style: style);
      break;
    default:
      text = Text('', style: style);
      break;
  }
  return SideTitleWidget(child: text, meta: meta);
}
