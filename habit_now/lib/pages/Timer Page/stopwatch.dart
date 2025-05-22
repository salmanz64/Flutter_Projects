import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class MyStopwatch extends StatefulWidget {
  StopWatchTimer stp;
  MyStopwatch({super.key, required this.stp});

  @override
  State<MyStopwatch> createState() => _StopwatchState();
}

class _StopwatchState extends State<MyStopwatch> {
  @override
  void dispose() {
    // TODO: implement dispose
    widget.stp.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(color: Colors.blue, width: 15),
          borderRadius: BorderRadius.circular(150),
        ),
        child: Center(
          child: StreamBuilder<int>(
            stream: widget.stp.rawTime,
            initialData: widget.stp.rawTime.value,
            builder: (context, snapshot) {
              final displayTime = StopWatchTimer.getDisplayTime(
                snapshot.data ?? 0,
                hours: false,
                milliSecond: false,
              );
              return Text(displayTime, style: TextStyle(fontSize: 50));
            },
          ),
        ),
      ),
    );
  }
}
