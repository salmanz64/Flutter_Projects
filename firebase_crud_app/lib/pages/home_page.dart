import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crud_app/services/firestore.dart';
import 'package:firebase_crud_app/utils/dialogbox.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  FirestoreService ft = FirestoreService();
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Color(0xFF5D536B),
          title: Center(
              child: Text(
            "CRUD ",
            style: TextStyle(color: Colors.white),
          )),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertBox(
                  controller: _controller,
                  option: "Create",
                );
              },
            );
          },
          child: const Icon(Icons.add),
        ),
        body: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: ft.getNotesStream(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List notesList = snapshot.data!.docs;

                  return Expanded(
                      child: ListView.builder(
                    itemCount: notesList.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot document = notesList[index];
                      String docID = document.id;
                      Map<String, dynamic> data =
                          document.data() as Map<String, dynamic>;
                      String noteText = data['note'];

                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ListTile(
                          minTileHeight: 100,
                          title: Text(noteText),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          tileColor: Colors.white,
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertBox(
                                          controller: TextEditingController(
                                              text: noteText),
                                          option: "Edit",
                                          docID: docID,
                                        );
                                      },
                                    );
                                  },
                                  child: Icon(Icons.settings)),
                              SizedBox(
                                width: 20,
                              ),
                              GestureDetector(
                                  onTap: () => ft.deleteNote(docID),
                                  child: Icon(Icons.delete))
                            ],
                          ),
                        ),
                      );
                    },
                  ));
                } else {
                  return Text("No data ");
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
