import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HabitCard extends StatefulWidget {
  String habitName;
  bool isStarted;
  int timeSpent;
  int timeGoal;
  VoidCallback onTap;
  HabitCard({
    super.key,
    required this.habitName,
    required this.isStarted,
    required this.timeSpent,
    required this.timeGoal,
    required this.onTap,
  });

  @override
  State<HabitCard> createState() => _HabitCardState();
}

class _HabitCardState extends State<HabitCard> {
  String formatToString(timespent) {
    String secs = (timespent % 60).toString();
    String mins = (timespent / 60).toStringAsFixed(5);
    if (secs.length == 1) {
      secs = '0$secs';
    }
    if (mins[1] == ".") {
      mins = mins.substring(0, 1);
    }
    return mins + ":" + secs;
  }

  double percentCompleted() {
    return (widget.timeSpent / (widget.timeGoal)) * 100;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              GestureDetector(
                onTap: widget.onTap,
                child: CircularPercentIndicator(
                  radius: 30,
                  progressColor: percentCompleted() / 100 > 0.5
                      ? Colors.green
                      : Colors.red,
                  percent: percentCompleted() / 100 < 1.00
                      ? percentCompleted() / 100
                      : 1.00,
                  center: widget.isStarted
                      ? Icon(Icons.pause)
                      : Icon(Icons.play_arrow),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.habitName,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    formatToString(widget.timeSpent) +
                        " : " +
                        formatToString(widget.timeGoal) +
                        " = " +
                        percentCompleted().toInt().toString() +
                        "%",
                    style: TextStyle(color: Colors.grey, fontSize: 17),
                  ),
                ],
              ),
            ],
          ),
          const Icon(Icons.settings)
        ]),
      ),
    );
  }
}
