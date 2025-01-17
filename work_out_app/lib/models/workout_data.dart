import 'package:flutter/material.dart';
import 'package:work_out_app/models/exercise.dart';
import 'package:work_out_app/models/workout.dart';

class WorkoutData extends ChangeNotifier {
  List<Workout> _workoutLists = [
    Workout(workoutName: "Upper Body", exercises: [
      Exercise(
          name: "Bicep curls", weight: "10kg", reps: "10 reps", sets: "3 sets")
    ])
  ];

  // get workoutlists
  List<Workout> workoutLists() {
    return _workoutLists;
  }

  //return wokroutlenght
  int workoutLength() {
    return _workoutLists.length;
  }

  //add workout
  void addWorkout(String name) {
    _workoutLists.add(Workout(workoutName: name, exercises: []));
    notifyListeners();
  }

  //add Exercise
  void addExercise(String workoutName, String name, String weight, String reps,
      String sets) {
    Workout workout = findRelevantWorkout(workoutName);
    workout.exercises
        .add(Exercise(name: name, weight: weight, reps: reps, sets: sets));

    notifyListeners();
  }

  //checkoff the exercise
  void checkOffExercise(String workName, String exName) {
    Exercise exercise = findRelevantExercise(workName, exName);
    exercise.isCompleted = !exercise.isCompleted;

    notifyListeners();
  }

  //find relvent workout
  Workout findRelevantWorkout(String name) {
    return _workoutLists.firstWhere((workout) => workout.workoutName == name);
  }

  //find relevant exercise
  Exercise findRelevantExercise(String wkname, String exName) {
    Workout workout = findRelevantWorkout(wkname);

    return workout.exercises.firstWhere((exercise) => exercise.name == exName);
  }
}
