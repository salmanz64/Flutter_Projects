import 'dart:ffi';

import 'package:flutter/material.dart';

class Habit {
  String category;
  String title;
  int? notfid;
  String description;
  int priority;
  final List dates;
  TimeOfDay? time;
  int bestStreak;

  Habit({
    this.bestStreak = 0,
    this.notfid,
    required this.category,
    required this.title,
    this.description = "",
    this.priority = 0,
    this.time,
    required this.dates,
  });
}
