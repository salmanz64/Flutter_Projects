import 'package:flutter/material.dart';

class WorkoutCard extends StatelessWidget {
  const WorkoutCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.grey[900]),
        child: ListTile(
          contentPadding: const EdgeInsets.all(10),
          textColor: Colors.white,
          leading: Image.asset('lib/assets/dumbell.png'),
          title: const Text(
            "Upper Body",
            style: TextStyle(fontSize: 20),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }
}
