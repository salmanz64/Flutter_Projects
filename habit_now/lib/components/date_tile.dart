import 'package:flutter/material.dart';

class DateTile extends StatelessWidget {
  int? status;
  bool isActive;
  double height, width;
  String dayOfWeek;
  String dayOfMonth;
  Color? color;

  DateTile({
    super.key,
    this.status,
    required this.color,
    required this.isActive,
    required this.height,
    required this.width,
    required this.dayOfMonth,
    required this.dayOfWeek,
  });

  @override
  Widget build(BuildContext context) {
    final statusColor = {
      0: Theme.of(context).colorScheme.primaryContainer,
      1: const Color.fromARGB(255, 11, 219, 18),
      2: const Color.fromARGB(255, 205, 27, 15),
      3: Colors.yellow,
    };
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: isActive ? Colors.blue : color,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: Text(
                dayOfWeek,
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(15),
                    top: Radius.circular(15),
                  ),
                  color:
                      (isActive
                          ? Colors.blue[700]
                          : (status != null
                              ? statusColor[status]
                              : Theme.of(
                                context,
                              ).colorScheme.primaryContainer)),
                ),
                width: double.infinity,

                child: Stack(
                  children: [
                    Center(
                      child: Text(
                        dayOfMonth,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
