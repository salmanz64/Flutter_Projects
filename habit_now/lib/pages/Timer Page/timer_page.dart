import 'package:flutter/material.dart';
import 'package:habit_now/pages/Timer%20Page/stopwatch.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:toggle_switch/toggle_switch.dart';

class TimerPage extends StatefulWidget {
  TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countUp,
  );
  bool isRunning = false;

  @override
  void dispose() {
    _stopWatchTimer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Spacer(),
          MyStopwatch(stp: _stopWatchTimer),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap:
                    () => {
                      setState(() {
                        !isRunning
                            ? _stopWatchTimer.onStartTimer()
                            : _stopWatchTimer.onStopTimer();
                        isRunning = !isRunning;
                      }),
                    },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.play_arrow),
                      SizedBox(width: 7),
                      Text(
                        !isRunning ? "Start" : "Pause",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 20),
              isRunning
                  ? GestureDetector(
                    onTap: () {
                      setState(() {
                        _stopWatchTimer.onResetTimer();
                        isRunning = !isRunning;
                      });
                    },
                    child: Container(
                      width: 120,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.stop),
                          SizedBox(width: 7),
                          Text("Stop", style: TextStyle(fontSize: 20)),
                        ],
                      ),
                    ),
                  )
                  : SizedBox(),
            ],
          ),
          SizedBox(height: 40),
          ToggleSwitch(
            initialLabelIndex: 0,
            minHeight: 75,
            minWidth: double.infinity,
            activeBgColor: [Colors.blue],
            inactiveBgColor: Colors.black,
            borderWidth: 1,
            animate: true,
            animationDuration: 500,

            customWidgets: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(Icons.timer), Text("StopWatch")],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(Icons.hourglass_bottom), Text("Countdown")],
              ),
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}
