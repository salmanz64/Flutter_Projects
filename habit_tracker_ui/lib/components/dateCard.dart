import 'package:flutter/material.dart';

class DateCard extends StatelessWidget {
  const DateCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 80,
      child: Card(
        color: const Color.fromARGB(255, 243, 106, 37),
        elevation: 5,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Text(
            "Tue",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            "06",
            style: TextStyle(color: Colors.white, fontSize: 20),
          )
        ]),
      ),
    );
  }
}
