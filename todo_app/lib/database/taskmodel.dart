import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class TodoDatabase extends ChangeNotifier {
  List todo = [];
  List tdTasks = [];
  Map<String, dynamic> categories = {
    "Skills": {"color": Colors.blue, "todos": []},
    "Entertainment": {"color": Colors.red, "todos": []},
    "Career": {"color": Colors.green, "todos": []},
    "Health": {"color": Colors.pink, "todos": []},
    "Finance": {"color": Colors.purple, "todos": []}
  };

  final _mybox = Hive.box("mybox");

  Future<void> loadData() async {
    todo = await _mybox.get("todo") ?? [];
    todaysTask();
    categorizeTasks();
    notifyListeners();
  }

  Future<void> insertTodo(List newtodo) async {
    todo.add(newtodo);
    print(todo);
    await _mybox.put("todo", todo);
    todaysTask();
    categorizeTasks();
    notifyListeners();
  }

  Future<void> deleteTodo(int index) async {
    todo.removeAt(index);
    tdTasks.removeAt(index);
    await _mybox.put("todo", todo);
    categorizeTasks();
    notifyListeners();
  }

  Future<void> updateTask(int index, bool checked) async {
    todo[index][4] = checked;
    await _mybox.put("todo", todo);
    notifyListeners();
  }

  void categorizeTasks() {
    categories.forEach((key, value) {
      categories[key]["todos"] = [];
    });

    for (int i = 0; i < todo.length; i++) {
      if (todo[i][1] == "Skills") {
        categories["Skills"]["todos"].add(todo[i]);
      } else if (todo[i][1] == "Entertainment") {
        categories["Entertainment"]["todos"].add(todo[i]);
      } else if (todo[i][1] == "Career") {
        categories["Career"]["todos"].add(todo[i]);
      } else if (todo[i][1] == "Health") {
        categories["Health"]["todos"].add(todo[i]);
      } else if (todo[i][1] == "Finance") {
        categories["Finance"]["todos"].add(todo[i]);
      }
    }
  }

  void todaysTask() {
    tdTasks = [];
    DateTime today = DateTime.now();
    String todaysDate = DateFormat('yyyy-MM-dd').format(today);
    for (int i = 0; i < todo.length; i++) {
      if (todo[i][2] == todaysDate) {
        tdTasks.add(todo[i]);
      }
    }
    print(tdTasks);
  }
}
