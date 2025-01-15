import 'package:flutter/material.dart';

class ExerciseCard extends StatelessWidget {
  const ExerciseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        height: 120,
        width: MediaQuery.of(context).size.width - 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Exercise 1',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Chip(
                        backgroundColor: Colors.grey[700],
                        shape: const OvalBorder(eccentricity: 1),
                        label: const Text(
                          "10kg",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Chip(
                        backgroundColor: Colors.grey[700],
                        shape: const OvalBorder(eccentricity: 1),
                        label: const Text(
                          "10kg",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Chip(
                        backgroundColor: Colors.grey[700],
                        shape: const OvalBorder(eccentricity: 1),
                        label: const Text(
                          "10kg",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Checkbox(
              value: true,
              onChanged: (value) {},
            )
          ],
        ),
      ),
    );
  }
}
