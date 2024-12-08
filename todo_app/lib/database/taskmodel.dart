import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabse {
  List todo = [];
  final _mybox = Hive.box("mybox");

  void loadData() {
    todo = _mybox.get("todo") ?? [];
  }

  Future<void> insertTodo(List newtodo) async {
    _mybox.put("todo", newtodo);
    todo = newtodo;
  }
}
