import 'package:firebase_crud_app/services/firestore.dart';
import 'package:flutter/material.dart';

class AlertBox extends StatelessWidget {
  TextEditingController controller;
  String option;
  String? docID;

  AlertBox(
      {super.key, required this.controller, required this.option, this.docID});

  FirestoreService ft = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: TextField(
        controller: controller,
      ),
      actions: [
        ElevatedButton(
          onPressed: () => {
            option == "Create"
                ? ft.addNote(controller.text)
                : ft.updateNote(docID!, controller.text)
          },
          child: const Text("Save"),
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("No"))
      ],
    );
    ;
  }
}
