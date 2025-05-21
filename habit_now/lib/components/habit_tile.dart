import 'package:flutter/material.dart';
import 'package:habit_now/database/habit_data.dart';
import 'package:habit_now/models/habit.dart';
import 'package:habit_now/models/habitStatus.dart';
import 'package:habit_now/utils/categories.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

class HabitTile extends StatefulWidget {
  HabitStatus hbs;
  String date;

  /* 0 for not done yet 
     1 for it is past and yet not checked
     2 for not done
     3 for done
  */

  HabitTile({super.key, required this.hbs, required this.date});

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
            color: Theme.of(context).colorScheme.tertiary,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.all(10),

          child: Icon(
            categories.firstWhere(
              (element) => element['name'] == widget.hbs.hb.category,
            )['icon'],
            color:
                categories.firstWhere(
                  (element) => element['name'] == widget.hbs.hb.category,
                )['color'],
          ),
        ),
        title: Text(
          widget.hbs.hb.title,
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
        subtitle: Row(
          children: [
            Text(
              "10P",
              style: TextStyle(
                color:
                    categories.firstWhere(
                      (element) => element['name'] == widget.hbs.hb.category,
                    )['color'],
              ),
            ),
            SizedBox(width: width * 0.03),
            widget.hbs.hb.time == null
                ? SizedBox()
                : Icon(Icons.notifications_none, color: Colors.grey, size: 16),
            SizedBox(width: width * 0.01),
            Text(
              widget.hbs.hb.time?.format(context) ?? "",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
        trailing: GestureDetector(
          onTap: () {
            setState(() {
              Provider.of<HabitData>(
                context,
                listen: false,
              ).updateStatus(widget.date, widget.hbs.hb.title);
            });
          },
          child: Container(
            width: width * 0.09,
            height: height * 0.09,
            child: isDone_Icon[widget.hbs.isDone],
            decoration: BoxDecoration(
              color: Colors.white12,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
