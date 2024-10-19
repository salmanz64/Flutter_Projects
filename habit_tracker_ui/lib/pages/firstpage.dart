import 'package:flutter/material.dart';
import 'package:habit_tracker_ui/components/habitCategoryCard.dart';

class FirstPage extends StatelessWidget {
  FirstPage({super.key});

  List<List> categories = [
    [Icons.directions_run, "Work Out"],
    [Icons.food_bank, "Eat Food"],
    [Icons.music_note, "Music"],
    [Icons.design_services_outlined, "Art & design"],
    [Icons.travel_explore, "Travellling"],
    [Icons.menu_book_rounded, "Read book"],
    [Icons.gamepad, "Gaming"],
    [Icons.settings, "Mechanic"]
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Choose Habit",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Chose your daily habits, you can choose \n more than one",
              style: TextStyle(fontWeight: FontWeight.w100, color: Colors.grey),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2.5,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemBuilder: (context, index) {
                  return HabitCategoryCard(
                    icon: categories[index][0],
                    title: categories[index][1],
                  );
                },
                itemCount: 8,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Center(
                child: Text(
                  "Get Started",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
