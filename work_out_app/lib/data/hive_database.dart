import 'package:hive/hive.dart';
import 'package:work_out_app/dateTime/date_time.dart';
import 'package:work_out_app/models/exercise.dart';
import 'package:work_out_app/models/workout.dart';

class HiveDatabase {
  var _mybox = Hive.box("workout_data");

  bool isPreviousData() {
    if (_mybox.isEmpty) {
      _mybox.put("START_DATE", todayDateYYMMDD());
      return false;
    } else {
      print("Previous data already exists");
      return true;
    }
  }

  String getStartDate() {
    return _mybox.get("START_DATE");
  }

  void saveToDatabase(List<Workout> workouts) {
    List workoutList = convertObjectTOWorkoutList(workouts);
    List exercises = convertObjectToExerciseList(workouts);

    if (exerciseIsCompleted(workouts)) {
      _mybox.put("COMPLETION_STATUS_${todayDateYYMMDD()}", 1);
    } else {
      _mybox.put("COMPLETION_STATUS_${todayDateYYMMDD()}", 0);
    }

    _mybox.put("WORKOUTS", workoutList);
    _mybox.put("EXERCISES", exercises);
  }

  List<Workout> readFromDatabase() {
    List<Workout> mySavedWorkout = [];
    List workoutList = _mybox.get("WORKOUTS");
    final exerciseList = _mybox.get("EXERCISES");

    for (int i = 0; i < workoutList.length; i++) {
      List<Exercise> exercisesInEachWorkout = [];

      for (int j = 0; j < exerciseList[i].length; j++) {
        exercisesInEachWorkout.add(Exercise(
            name: exerciseList[i][j][0],
            weight: exerciseList[i][j][1],
            reps: exerciseList[i][j][2],
            sets: exerciseList[i][j][3],
            isCompleted: exerciseList[i][j][4] == "true" ? true : false));
        print(exerciseList[i][j][4]);
      }
      Workout workout = Workout(
          workoutName: workoutList[i], exercises: exercisesInEachWorkout);
      mySavedWorkout.add(workout);
    }
    return mySavedWorkout;
  }

  int completionStatus(String yymmdd) {
    int completionStatus = _mybox.get("COMPLETION_STATUS_$yymmdd") ?? 0;
    return completionStatus;
  }
}

bool exerciseIsCompleted(List<Workout> workouts) {
  for (var workout in workouts) {
    for (var exercise in workout.exercises) {
      if (exercise.isCompleted) {
        return true;
      }
    }
  }
  return false;
}

List<String> convertObjectTOWorkoutList(List<Workout> workouts) {
  List<String> workoutList = [];

  for (int i = 0; i < workouts.length; i++) {
    workoutList.add(workouts[i].workoutName);
  }

  return workoutList;
}

List<List<List<String>>> convertObjectToExerciseList(List<Workout> workouts) {
  List<List<List<String>>> exercisesList = [];

  for (int i = 0; i < workouts.length; i++) {
    List<List<String>> exerciseList = [];

    for (int j = 0; j < workouts[i].exercises.length; j++) {
      List<String> exercise = [];

      exercise.addAll([
        workouts[i].exercises[j].name,
        workouts[i].exercises[j].reps,
        workouts[i].exercises[j].sets,
        workouts[i].exercises[j].weight,
        workouts[i].exercises[j].isCompleted.toString()
      ]);
      exerciseList.add(exercise);
    }
    exercisesList.add(exerciseList);
  }

  return exercisesList;
}
