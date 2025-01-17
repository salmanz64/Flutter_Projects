import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_out_app/models/workout_data.dart';
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
              style: TextStyle(color: Colors.white),
              controller: _workoutController,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  hintText: "New Workout",
                  hintStyle: const TextStyle(color: Colors.white70),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)))),
          actions: [
            ElevatedButton(
              onPressed: () {
                Provider.of<WorkoutData>(context, listen: false)
                    .addWorkout(_workoutController.text);
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: const Text(
                "Save",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
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
    return Consumer<WorkoutData>(
      builder: (context, value, child) {
        return Scaffold(
          backgroundColor: Colors.grey[300],
          body: Column(
            children: [
              const SizedBox(
                height: 150,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: value.workoutLength(),
                  itemBuilder: (context, index) {
                    return WorkoutCard(
                      workoutName: value.workoutLists()[index].workoutName,
                      exercises: value.workoutLists()[index].exercises,
                    );
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
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
