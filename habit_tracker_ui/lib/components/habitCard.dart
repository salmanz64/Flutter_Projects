import 'package:flutter/material.dart';

class HabitCard extends StatelessWidget {
  IconData icon;
  String title;
  HabitCard({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 180,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    icon,
                    size: 100,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)),
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.check,
                      size: 18,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  "Describe the details",
                  style: TextStyle(color: Colors.grey),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
