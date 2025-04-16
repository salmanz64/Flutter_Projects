import 'dart:ffi';

class Habit {
  String category;
  String title;
  String description;
  int priority;
  final List dates;
  final int time;
  final int isDone = 0;

  Habit({
    required this.category,
    required this.title,
    required this.description,
    this.priority = 0,
    this.time = 0,
    required this.dates,
  });
}
