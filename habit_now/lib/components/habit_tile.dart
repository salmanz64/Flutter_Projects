import 'package:flutter/material.dart';
import 'package:habit_now/utils/categories.dart';
import 'package:icons_plus/icons_plus.dart';

class HabitTile extends StatefulWidget {
  String name;
  String category;

  /* 0 for not done yet 
     1 for it is past and yet not checked
     2 for not done
     3 for done
  */
  int isDone;
  HabitTile({
    super.key,
    required this.isDone,
    required this.category,
    required this.name,
  });

  @override
  State<HabitTile> createState() => _HabitTileState();
}

class _HabitTileState extends State<HabitTile> {
  final isDone_Icon = {
    0: Text(""),
    1: Icon(Icons.check, color: Colors.green),
    2: Icon(Icons.close_outlined, color: Colors.red),
    3: Icon(Icons.timelapse, color: Colors.yellow),
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

          child: Icon(
            categories.firstWhere(
              (element) => element['name'] == widget.category,
            )['icon'],
            color:
                categories.firstWhere(
                  (element) => element['name'] == widget.category,
                )['color'],
          ),
        ),
        title: Text(widget.name, style: TextStyle(color: Colors.white)),
        subtitle: Row(
          children: [
            Text(
              "10P",
              style: TextStyle(
                color:
                    categories.firstWhere(
                      (element) => element['name'] == widget.category,
                    )['color'],
              ),
            ),
            SizedBox(width: width * 0.03),
            Icon(Icons.notifications_none, color: Colors.grey, size: 16),
            SizedBox(width: width * 0.01),
            Text("05:30", style: TextStyle(color: Colors.grey)),
          ],
        ),
        trailing: GestureDetector(
          onTap: () {
            setState(() {
              widget.isDone = (widget.isDone + 1) % 3;
            });
          },
          child: Container(
            width: width * 0.09,
            height: height * 0.09,
            child: isDone_Icon[widget.isDone],
            decoration: BoxDecoration(
              color: Colors.white10,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
