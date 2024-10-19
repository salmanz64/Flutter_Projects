import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServie {
  final CollectionReference notes =
      FirebaseFirestore.instance.collection('notes');

  Future<void> addNote(String note) {
    return notes.add({'note': note, 'timeStamp': Timestamp.now()});
  }

  Stream<QuerySnapshot> getNotesStream() {
    final notesStream =
        notes.orderBy('timeStamp', descending: true).snapshots();
    return notesStream;
  }

  Future<void> updateNote(String docID, String newNote) {
    return notes
        .doc(docID)
        .update({'note': newNote, 'timeStamp': Timestamp.now()});
  }

  Future<void> deleteNote(String docID) {
    return notes.doc(docID).delete();
  }
}
