import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTasks extends StatelessWidget {
  DateTime? selectedDate;
  AddTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add New Task"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const TextField(
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 20,
          ),
          DropdownMenu(dropdownMenuEntries: List.empty()),
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
                      Text(DateFormat('yyyy-MM-dd')
                          .format(selectedDate ?? DateTime.now())),
                    ],
                  ),
                  TextButton(
                    child: const Text("Change"),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          )
        ],
      ),
      actions: [
        ElevatedButton(onPressed: () {}, child: const Text("yes")),
        ElevatedButton(onPressed: () {}, child: const Text("No"))
      ],
    );
  }
}
