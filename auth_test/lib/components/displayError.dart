import 'package:flutter/material.dart';

void displayErrorMessage(String error, context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(error),
    ),
  );
}
