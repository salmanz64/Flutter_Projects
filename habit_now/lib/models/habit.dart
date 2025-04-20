import 'dart:ffi';

import 'package:flutter/material.dart';

class Habit {
  String category;
  String title;
  String description;
  int priority;
  final List dates;
  TimeOfDay? time;

  Habit({
    required this.category,
    required this.title,
    required this.description,
    this.priority = 0,
    this.time,
    required this.dates,
  });
}
