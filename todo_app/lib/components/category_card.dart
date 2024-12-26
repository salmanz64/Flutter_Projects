import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/database/taskmodel.dart';

class CategoryCard extends StatelessWidget {
  String title;

  CategoryCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoDatabase>(
      builder: (context, value, child) {
        return Card(
          elevation: 5,
          color: Colors.white,
          child: SizedBox(
            width: 200,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${value.categories[title]["todos"].length} tasks",
                    style: const TextStyle(
                      color: Color(0XFF99A4C3),
                    ),
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () => print(value.categories[title].length / 10),
                    child: LinearProgressIndicator(
                      backgroundColor: const Color(0XFF99A4C3),
                      borderRadius: BorderRadius.circular(20),
                      minHeight: 4,
                      color: value.categories[title]["color"],
                      value: value.categories[title]["todos"].length / 10,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
