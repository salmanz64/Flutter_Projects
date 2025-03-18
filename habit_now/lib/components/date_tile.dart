import 'package:flutter/material.dart';

class DateTile extends StatelessWidget {
  bool isActive;
  DateTile({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
      child: Container(
        width: width * 0.13,
        height: height * 0.07,
        decoration: BoxDecoration(
          color: isActive ? Colors.blue : Colors.black,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: Text("Sun", style: TextStyle(color: Colors.white)),
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
                        "22",
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
