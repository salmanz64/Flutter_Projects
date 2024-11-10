import 'package:flutter/material.dart';

class TodoCards extends StatelessWidget {
  const TodoCards({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: Icon(Icons.circle_outlined),
      title: Text("Daily meeting with team"),
      iconColor: Colors.blue,
      tileColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
    );
  }
}
