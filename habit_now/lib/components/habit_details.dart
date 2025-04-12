import 'package:flutter/material.dart';
import 'package:habit_now/components/date_tile.dart';
import 'package:habit_now/utils/categories.dart';

class HabitDetails extends StatelessWidget {
  final String category;
  final int isDone;
  final String name;

  HabitDetails({
    super.key,
    required this.category,
    required this.isDone,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
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
                                  (element) => element['name'] == category,
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
                            name,
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
                                    (element) => element['name'] == category,
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
                        (element) => element['name'] == category,
                      )['icon'],
                      color:
                          categories.firstWhere(
                            (element) => element['name'] == category,
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
                    return DateTile(
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
                              (element) => element['name'] == category,
                            )['color'],
                      ),
                      SizedBox(width: width * 0.01),
                      Text("1", style: TextStyle(color: Colors.white)),
                      SizedBox(width: width * 0.03),
                      Icon(
                        Icons.check_circle_outline,
                        color:
                            categories.firstWhere(
                              (element) => element['name'] == category,
                            )['color'],
                      ),
                      SizedBox(width: width * 0.01),
                      Text("100%", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.stacked_bar_chart, color: Colors.white),
                      Icon(Icons.more_vert, color: Colors.white),
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
