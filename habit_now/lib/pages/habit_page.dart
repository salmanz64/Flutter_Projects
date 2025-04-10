import 'package:flutter/material.dart';
import 'package:habit_now/components/date_tile.dart';
import 'package:habit_now/components/habit_details.dart';

class HabitPage extends StatelessWidget {
  const HabitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 7,
            itemBuilder: (context, index) {
              return HabitDetails();
            },
          ),
        ),
      ],
    );
  }
}
