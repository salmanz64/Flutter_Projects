import 'package:flutter/material.dart';
import 'package:habit_now/database/habit_data.dart';
import 'package:habit_now/models/habit.dart';
import 'package:habit_now/utils/dates.dart';
import 'package:provider/provider.dart';

class HabitDetailPage extends StatefulWidget {
  final String category;
  HabitDetailPage({super.key, required this.category});

  @override
  State<HabitDetailPage> createState() => _HabitDetailPageState();
}

class _HabitDetailPageState extends State<HabitDetailPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TimeOfDay? picked;
  String _selectedDate = "Every Day";
  bool isSomeDays = false;
  //from monday
  List isDay = [false, false, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Define Your Habit", style: TextStyle(color: Colors.blue)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: "Habit",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                hintText: "Description (optional)",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            Text(
              "How Often Do you want to do it ?",
              style: TextStyle(color: Colors.blue, fontSize: 20),
            ),
            Row(
              children: [
                Radio(
                  value: "Every Day",
                  groupValue: _selectedDate,
                  onChanged: (value) {
                    setState(() {
                      _selectedDate = value ?? "Every Day";
                      isSomeDays = false;
                    });
                  },
                ),
                Text("Every Day", style: TextStyle(color: Colors.white)),
              ],
            ),

            Row(
              children: [
                Radio(
                  value: "Some Days of the week",
                  groupValue: _selectedDate,
                  onChanged: (value) {
                    setState(() {
                      _selectedDate = value ?? "";
                      isSomeDays = true;
                    });
                  },
                ),
                Text(
                  "Some Days of the week",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),

            isSomeDays
                ? SizedBox(
                  height: 150,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 3,
                    ),
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Checkbox(
                            value: isDay[index],
                            onChanged: (value) {
                              setState(() {
                                isDay[index] = !isDay[index];
                              });
                            },
                          ),
                          Text(
                            days[index],
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      );
                    },
                    itemCount: isDay.length,
                  ),
                )
                : SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.notifications_active, color: Colors.blue),
                      SizedBox(width: 10),
                      Text(
                        "Time and reminders",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),

                  GestureDetector(
                    onTap: () async {
                      picked = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                    },
                    child: Text("0", style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.flag, color: Colors.blue),
                      SizedBox(width: 10),
                      Text("Priority", style: TextStyle(color: Colors.white)),
                    ],
                  ),

                  Text("0", style: TextStyle(color: Colors.blue)),
                ],
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  final hb = Habit(
                    category: widget.category,
                    title: _nameController.text,
                    description: _descriptionController.text,
                    time: picked,
                    dates:
                        _selectedDate == "Every Day"
                            ? List.filled(7, true)
                            : isDay,
                  );

                  Provider.of<HabitData>(context, listen: false).addHabit(hb);
                  Provider.of<HabitData>(
                    context,
                    listen: false,
                  ).doSomeDaySummary();

                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Save",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
