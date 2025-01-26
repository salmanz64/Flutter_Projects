import 'package:flutter/material.dart';
import 'package:work_out_app/data/hive_database.dart';
import 'package:work_out_app/dateTime/date_time.dart';
import 'package:work_out_app/models/exercise.dart';
import 'package:work_out_app/models/workout.dart';

class WorkoutData extends ChangeNotifier {
  final db = HiveDatabase();

  List<Workout> _workoutLists = [];

  void initializeWorkoutList() {
    if (db.isPreviousData()) {
      _workoutLists = db.readFromDatabase();
    } else {
      db.saveToDatabase(_workoutLists);
    }
    loadHeatMap();
  }

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
    db.saveToDatabase(_workoutLists);
  }

  //add Exercise
  void addExercise(String workoutName, String name, String weight, String reps,
      String sets) {
    Workout workout = findRelevantWorkout(workoutName);
    workout.exercises.add(Exercise(
        name: name,
        weight: weight,
        reps: reps,
        sets: sets,
        isCompleted: false));

    notifyListeners();
    db.saveToDatabase(_workoutLists);
  }

  //checkoff the exercise
  void checkOffExercise(String workName, String exName) {
    Exercise exercise = findRelevantExercise(workName, exName);
    exercise.isCompleted = !exercise.isCompleted;

    notifyListeners();
    db.saveToDatabase(_workoutLists);
    loadHeatMap();
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

  String getStartDate() {
    return db.getStartDate();
  }

  Map<DateTime, int> heatMapDataSet = {};

  void loadHeatMap() {
    DateTime startDate = createDateTimeObject(getStartDate());

    int daysInBtw = DateTime.now().difference(startDate).inDays;

    for (int i = 0; i < daysInBtw + 1; i++) {
      String yyyymmdd = dateToString(startDate.add(Duration(days: 1)));
      int completionStatus = db.completionStatus(yyyymmdd);
      int year = startDate.add(Duration(days: 1)).year;
      int month = startDate.add(Duration(days: 1)).month;
      int day = startDate.add(Duration(days: 1)).day;
      final percentForEachDay = <DateTime, int>{
        DateTime(year, month, day): completionStatus
      };
      heatMapDataSet.addEntries(percentForEachDay.entries);
    }
  }
}
