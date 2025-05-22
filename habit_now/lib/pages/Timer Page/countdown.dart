// import 'package:flutter/material.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';

// class Countdown extends StatelessWidget {
//   const Countdown({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return  Center(
//       child: CircularPercentIndicator(
//         radius: 20,
//         animateFromLastPercent: true,
//         animation: true,
//         center: Center(
//           child: StreamBuilder<int>(
//             stream: widget.stp.rawTime,
//             initialData: widget.stp.rawTime.value,
//             builder: (context, snapshot) {
//               final displayTime = StopWatchTimer.getDisplayTime(
//                 snapshot.data ?? 0,
//                 hours: false,
//                 milliSecond: false,
//               );
//               return Text(displayTime, style: TextStyle(fontSize: 50));
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
