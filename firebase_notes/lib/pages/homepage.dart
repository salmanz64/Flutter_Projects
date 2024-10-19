import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_notes/services/firestoreService.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirestoreServie firestoreServie = FirestoreServie();
  final TextEditingController controller = TextEditingController();
  void openNoteBox({String? docID}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: TextField(
            controller: controller,
          ),
          actions: [
            ElevatedButton(
                onPressed: () => {
                      if (docID == null)
                        {
                          firestoreServie.addNote(controller.text),
                          controller.clear(),
                          Navigator.pop(context)
                        }
                      else
                        {
                          firestoreServie.updateNote(docID, controller.text),
                        }
                    },
                child: const Text("Add")),
            ElevatedButton(onPressed: () => {}, child: const Text("cancel"))
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notes")),
      floatingActionButton: FloatingActionButton(
        onPressed: openNoteBox,
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestoreServie.getNotesStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            List notesList = snapshot.data!.docs;
            return ListView.builder(
              itemCount: notesList.length,
              itemBuilder: (context, index) {
                DocumentSnapshot document = notesList[index];
                String docsID = document.id;
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                String noteText = data['note'];
                return ListTile(
                  title: Text(noteText),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.settings),
                        onPressed: () => openNoteBox(docID: docsID),
                      ),
                      IconButton(
                          onPressed: () => firestoreServie.deleteNote(docsID),
                          icon: Icon(Icons.delete))
                    ],
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
