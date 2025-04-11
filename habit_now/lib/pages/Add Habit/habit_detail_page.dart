import 'package:flutter/material.dart';

class HabitDetailPage extends StatelessWidget {
  const HabitDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text("Back"), Text("Next")],
        ),
      ),
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Define Your Habit", style: TextStyle(color: Colors.blue)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Habit",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: "Description (optional)",
                border: OutlineInputBorder(),
              ),
            ),

            Text(
              "How Often Do you want to do it",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
