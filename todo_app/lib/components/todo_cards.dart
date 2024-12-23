import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/database/taskmodel.dart';

class TodoCards extends StatefulWidget {
  int index;
  bool checked;
  String title;
  TodoCards(
      {super.key,
      required this.title,
      required this.index,
      required this.checked});

  @override
  State<TodoCards> createState() => _TodoCardsState();
}

class _TodoCardsState extends State<TodoCards> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: GestureDetector(
          onTap: () {
            setState(() {
              widget.checked = !widget.checked;
              Provider.of<TodoDatabase>(context, listen: false)
                  .updateTask(widget.index, widget.checked);
            });
          },
          child: widget.checked
              ? Icon(Icons.check_circle, color: Colors.blue[100])
              : const Icon(
                  Icons.circle_outlined,
                )),
      title: widget.checked
          ? Text(
              widget.title,
              style: TextStyle(decoration: TextDecoration.lineThrough),
            )
          : Text(widget.title),
      iconColor: Colors.blue,
      tileColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
    );
  }
}
