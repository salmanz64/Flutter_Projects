import 'package:flutter/material.dart';

void displayErrorMessage(context, msg) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(msg),
      );
    },
  );
}
