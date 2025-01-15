import 'package:flutter/material.dart';
import 'package:work_out_app/utils/exercise_card.dart';

class ExercisesScreen extends StatelessWidget {
  ExercisesScreen({super.key});
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
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return const ExerciseCard();
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
  }
}
