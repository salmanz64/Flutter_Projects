import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/database/taskmodel.dart';

class AddTasks extends StatefulWidget {
  AddTasks({super.key});

  @override
  State<AddTasks> createState() => _AddTasksState();
}

class _AddTasksState extends State<AddTasks> {
  List<String> prioritylist = <String>["High", "Medium", "Low"];
  List<String> categories = [
    "Skills",
    "Learning",
    "Career",
    "Health",
    "Finance",
    "Entertainment"
  ];

  String selectedCategory = "Skills";
  String? selectedPriority = "Medium";
  String? selectedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  final TextEditingController _controller = TextEditingController();

  final tododb = TodoDatabase();

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoDatabase>(
      builder: (context, value, child) {
        return AlertDialog(
          title: const Text("Add New Task"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "Enter Your Task"),
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                elevation: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.category),
                          Text("Categories"),
                        ],
                      ),
                      DropdownButton(
                        value: selectedCategory ?? categories[0],
                        items: categories.map<DropdownMenuItem<String>>(
                          (value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          },
                        ).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedCategory = value as String;
                          });
                        },
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                elevation: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.calendar_month),
                          Text(selectedDate!),
                        ],
                      ),
                      TextButton(
                        child: const Text("Change"),
                        onPressed: () {
                          Future<void> _selectedDate(
                              BuildContext context) async {
                            final picked = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2024),
                                lastDate: DateTime(2050));
                            if (picked != null &&
                                DateFormat('yyyy-MM-dd').format(picked) !=
                                    selectedDate) {
                              setState(() {
                                selectedDate =
                                    DateFormat('yyyy-MM-dd').format(picked);
                              });
                            }
                          }

                          _selectedDate(context);
                        },
                      )
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.flag),
                          Text("Priority"),
                        ],
                      ),
                      DropdownButton(
                        value: selectedPriority ?? prioritylist[1],
                        items: prioritylist.map<DropdownMenuItem<String>>(
                          (value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          },
                        ).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedPriority = value;
                          });
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          actions: [
            ElevatedButton(
                onPressed: () {
                  value.insertTodo([
                    _controller.text.toString(),
                    selectedCategory.toString(),
                    selectedDate.toString(),
                    selectedPriority.toString(),
                    false
                  ]);

                  Navigator.of(context).pop();
                },
                child: const Text("yes")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("No"))
          ],
        );
      },
    );
  }
}
