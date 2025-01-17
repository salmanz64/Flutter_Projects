import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_out_app/models/exercise.dart';
import 'package:work_out_app/models/workout_data.dart';
import 'package:work_out_app/utils/exercise_card.dart';

class ExercisesScreen extends StatelessWidget {
  final String workoutName;
  final List<Exercise> exercises;

  ExercisesScreen(
      {super.key, required this.workoutName, required this.exercises});

  final TextEditingController _exercisename = TextEditingController();
  final TextEditingController _weightcontroller = TextEditingController();
  final TextEditingController _repscontroller = TextEditingController();
  final TextEditingController _setscontroller = TextEditingController();

  Future<void> addExercise(context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey[900],
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                  style: TextStyle(color: Colors.white),
                  controller: _exercisename,
                  decoration: InputDecoration(
                      hintText: "Enter your Exercise",
                      hintStyle: const TextStyle(color: Colors.white70),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)))),
              const SizedBox(
                height: 10,
              ),
              TextField(
                  style: TextStyle(color: Colors.white),
                  controller: _weightcontroller,
                  decoration: InputDecoration(
                      hintText: "Weight (Kg)",
                      hintStyle: const TextStyle(color: Colors.white70),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)))),
              const SizedBox(
                height: 10,
              ),
              TextField(
                  style: TextStyle(color: Colors.white),
                  controller: _repscontroller,
                  decoration: InputDecoration(
                      hintText: "Reps",
                      hintStyle: const TextStyle(color: Colors.white70),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)))),
              const SizedBox(
                height: 10,
              ),
              TextField(
                  style: TextStyle(color: Colors.white),
                  controller: _setscontroller,
                  decoration: InputDecoration(
                      hintText: "Sets",
                      hintStyle: const TextStyle(color: Colors.white70),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)))),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Provider.of<WorkoutData>(context, listen: false).addExercise(
                    workoutName,
                    _exercisename.text,
                    _weightcontroller.text,
                    _repscontroller.text,
                    _setscontroller.text);
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
          appBar: AppBar(
            title: Text("Workout Tracker"),
          ),
          backgroundColor: Colors.grey[300],
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: exercises.length,
                  itemBuilder: (context, index) {
                    return ExerciseCard(
                        name: exercises[index].name,
                        reps: exercises[index].reps,
                        sets: exercises[index].sets,
                        weight: exercises[index].weight,
                        isCompleted: exercises[index].isCompleted,
                        workoutName: workoutName);
                  },
                ),
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              addExercise(context);
            },
            backgroundColor: Colors.grey[900],
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
