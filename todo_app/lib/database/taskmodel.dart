import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase extends ChangeNotifier {
  List todo = [];
  Map<String, dynamic> categories = {
    "Skills": [],
    "Entertainment": [],
    "Career": [],
    "Health": [],
    "Finance": []
  };

  final _mybox = Hive.box("mybox");

  Future<void> loadData() async {
    todo = await _mybox.get("todo") ?? [];
    categorizeTasks();
    notifyListeners();
  }

  Future<void> insertTodo(List newtodo) async {
    todo.add(newtodo);

    await _mybox.put("todo", todo);
    notifyListeners();
  }

  Future<void> deleteTodo(int index) async {
    todo.removeAt(index);
    await _mybox.put("todo", todo);
    notifyListeners();
  }

  Future<void> updateTask(int index, bool checked) async {
    todo[index][4] = checked;
    await _mybox.put("todo", todo);
    notifyListeners();
  }

  Future<void> categorizeTasks() async {
    categories.forEach((key, value) {
      categories[key] = [];
    });

    todo.map(
      (task) {
        if (task[1] == "Skills") {
          categories["Skills"].add(task);
        } else if (task[1] == "Entertainment") {
          categories["Entartainment"].add(task);
        } else if (task[1] == "Career") {
          categories["Career"].add(task);
        } else if (task[1] == "Health") {
          categories["Health"].add(task);
        } else if (task[1] == "Finance") {
          categories["Finance"].add(task);
        }
      },
    );
    notifyListeners();
  }
}
