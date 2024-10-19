import 'package:flutter/material.dart';

void displayMsgToUser(String msg, BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(msg),
      );
    },
  );
}
