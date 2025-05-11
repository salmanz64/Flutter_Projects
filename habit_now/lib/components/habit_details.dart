import 'package:flutter/material.dart';
import 'package:habit_now/components/date_tile.dart';
import 'package:habit_now/database/habit_data.dart';
import 'package:habit_now/models/habit.dart';
import 'package:habit_now/utils/categories.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HabitDetails extends StatelessWidget {
  final void Function(Habit) onTap;
  final Habit hb;
  DateTime date = DateTime.now().subtract(Duration(days: 2));

  HabitDetails({super.key, required this.onTap, required this.hb});

  @override
  Widget build(BuildContext context) {
    List<int> statuses = Provider.of<HabitData>(
      listen: false,
      context,
    ).findHabitStatuses(hb);
    int streak = Provider.of<HabitData>(listen: false, context).findStreak(hb);

    int completion = Provider.of<HabitData>(
      listen: false,
      context,
    ).findCompletion(hb);
    print(completion.isFinite);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height * 0.22,
        width: width - 20,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 0.2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(25),
              blurRadius: 10,
              offset: Offset(0, 4), // horizontal, vertical
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: width * 0.1,
                        width: width * 0.01,
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                categories.firstWhere(
                                  (element) => element['name'] == hb.category,
                                )['color'],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(width: width * 0.02),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            hb.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            "Every Day | 10P",
                            style: TextStyle(
                              color:
                                  categories.firstWhere(
                                    (element) => element['name'] == hb.category,
                                  )['color'],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(10),

                    child: Icon(
                      categories.firstWhere(
                        (element) => element['name'] == hb.category,
                      )['icon'],
                      color:
                          categories.firstWhere(
                            (element) => element['name'] == hb.category,
                          )['color'],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.08,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    DateTime days = date.add(Duration(days: index));
                    String dayOfWeek = DateFormat('E').format(days);
                    String dayOfMonth = DateFormat('d').format(days);

                    return DateTile(
                      status: statuses[index],
                      dayOfMonth: dayOfMonth,
                      dayOfWeek: dayOfWeek,
                      isActive: false,
                      height: height * 0.08,
                      width: width * 0.1,
                    );
                  },
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Divider(color: Colors.grey, thickness: 0.4),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.line_axis,
                        color:
                            categories.firstWhere(
                              (element) => element['name'] == hb.category,
                            )['color'],
                      ),
                      SizedBox(width: width * 0.01),
                      Text(
                        streak.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(width: width * 0.03),
                      Icon(
                        Icons.check_circle_outline,
                        color:
                            categories.firstWhere(
                              (element) => element['name'] == hb.category,
                            )['color'],
                      ),
                      SizedBox(width: width * 0.01),
                      Text(
                        "$completion%",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.stacked_bar_chart, color: Colors.white),
                      GestureDetector(
                        onTap: () {
                          onTap(hb);
                        },
                        child: Icon(Icons.more_vert, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
