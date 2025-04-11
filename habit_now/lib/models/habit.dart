import 'dart:ffi';

class Habit {
  final String category;
  final String title;
  final String description;
  final int priority;
  final DateTime date;
  final DateTime time;
  final int isDone = 0;

  Habit({
    required this.category,
    required this.title,
    required this.description,
    required this.priority,
    required this.time,
    required this.date,
  });
}
