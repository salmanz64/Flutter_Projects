import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_out_app/models/workout_data.dart';

class ExerciseCard extends StatelessWidget {
  final String workoutName;
  final String name;
  final String weight;
  final String reps;
  final String sets;
  bool isCompleted;
  ExerciseCard(
      {super.key,
      required this.workoutName,
      required this.name,
      required this.weight,
      required this.reps,
      required this.sets,
      required this.isCompleted});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        height: 120,
        width: MediaQuery.of(context).size.width - 100,
        decoration: BoxDecoration(
          color: isCompleted ? Colors.green : Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: isCompleted ? Colors.white : Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Chip(
                        backgroundColor: Colors.grey[700],
                        shape: const OvalBorder(eccentricity: 1),
                        label: Text(
                          weight,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Chip(
                        backgroundColor: Colors.grey[700],
                        shape: const OvalBorder(eccentricity: 1),
                        label: Text(
                          reps,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Chip(
                        backgroundColor: Colors.grey[700],
                        shape: const OvalBorder(eccentricity: 1),
                        label: Text(
                          sets,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Checkbox(
              value: isCompleted,
              onChanged: (value) {
                Provider.of<WorkoutData>(context, listen: false)
                    .checkOffExercise(workoutName, name);
              },
            )
          ],
        ),
      ),
    );
  }
}
