import 'package:work_out_app/models/exercise.dart';

class Workout {
  final String workoutName;
  final List<Exercise> exercises;

  Workout({required this.workoutName, required this.exercises});
}
