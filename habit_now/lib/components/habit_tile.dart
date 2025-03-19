import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class HabitTile extends StatelessWidget {
  /* 0 for not done yet 
     1 for it is past and yet not checked
     2 for not done
     3 for done
  */
  int isDone;
  HabitTile({super.key, required this.isDone});

  final isDone_Icon = {
    0: Text(""),
    1: Icon(Icons.timelapse, color: Colors.yellow),
    2: Icon(Icons.close_outlined, color: Colors.red),
    3: Icon(Icons.check, color: Colors.green),
  };

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 1, 0, 0),
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.all(10),

          child: Icon(Icons.brush, color: Colors.red),
        ),
        title: Text(
          "Learn Something new",
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Row(
          children: [
            Text("10P", style: TextStyle(color: Colors.red)),
            SizedBox(width: width * 0.03),
            Icon(Icons.notifications_none, color: Colors.grey, size: 16),
            SizedBox(width: width * 0.01),
            Text("05:30", style: TextStyle(color: Colors.grey)),
          ],
        ),
        trailing: Container(
          width: width * 0.09,
          height: height * 0.09,
          child: isDone_Icon[isDone],
          decoration: BoxDecoration(
            color: Colors.white10,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
