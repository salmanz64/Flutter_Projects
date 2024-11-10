import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
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
              const Text(
                "40 tasks",
                style: TextStyle(
                  color: Color(0XFF99A4C3),
                ),
              ),
              const Text(
                "Business",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              LinearProgressIndicator(
                backgroundColor: const Color(0XFF99A4C3),
                borderRadius: BorderRadius.circular(20),
                minHeight: 4,
                color: Colors.blue,
                value: 0.7,
              )
            ],
          ),
        ),
      ),
    );
  }
}
