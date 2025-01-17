import 'package:flutter/material.dart';
import 'package:work_out_app/models/exercise.dart';
import 'package:work_out_app/screens/exercises_screen.dart';

class WorkoutCard extends StatelessWidget {
  String workoutName;
  List<Exercise> exercises;
  WorkoutCard({super.key, required this.workoutName, required this.exercises});

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
          title: Text(
            workoutName,
            style: const TextStyle(fontSize: 20),
          ),
          trailing: GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ExercisesScreen(
                workoutName: workoutName,
                exercises: exercises,
              ),
            )),
            child: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}
