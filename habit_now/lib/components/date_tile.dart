import 'package:flutter/material.dart';

class DateTile extends StatelessWidget {
  bool isActive;
  double height, width;
  String dayOfWeek;
  String dayOfMonth;
  DateTile({
    super.key,
    required this.isActive,
    required this.height,
    required this.width,
    required this.dayOfMonth,
    required this.dayOfWeek,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: isActive ? Colors.blue : Colors.black,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: Text(dayOfWeek, style: TextStyle(color: Colors.white)),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(15),
                    top: Radius.circular(15),
                  ),
                  color: (isActive ? Colors.blue[700] : Colors.grey.shade900),
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
