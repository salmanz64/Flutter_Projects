import 'package:flutter/material.dart';
import 'package:work_out_app/utils/workout_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController _workoutController = TextEditingController();

  Future<void> addWorkout(context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey[900],
          content: TextField(
              controller: _workoutController,
              decoration: InputDecoration(
                  hintText: "New Workout",
                  hintStyle: const TextStyle(color: Colors.white70),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)))),
          actions: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: const Text(
                "Save",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          const SizedBox(
            height: 150,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return const WorkoutCard();
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addWorkout(context);
        },
        backgroundColor: Colors.black87,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
