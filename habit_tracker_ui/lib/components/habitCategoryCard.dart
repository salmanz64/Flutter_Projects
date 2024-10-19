import 'package:flutter/material.dart';

class HabitCategoryCard extends StatelessWidget {
  final IconData icon;
  final String title;
  const HabitCategoryCard({
    required this.icon,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
            width: 1,
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 30,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
