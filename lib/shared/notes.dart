import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('notes');

final FirebaseAuth _auth = FirebaseAuth.instance;

Future<void> addNote({
  required String title,
  required String description,
}) async {
  DocumentReference documentReferencer = _mainCollection.doc();

  Map<String, dynamic> data = <String, dynamic>{
    "title": title,
    "description": description,
    "uid": _auth.currentUser!.uid,
  };

  await documentReferencer.set(data);
}

Future<void> updateNote({
  required String title,
  required String description,
  required String docId,
}) async {
  DocumentReference documentReferencer = _mainCollection.doc(docId);

  Map<String, dynamic> data = <String, dynamic>{
    "title": title,
    "description": description,
    "uid": _auth.currentUser!.uid,
  };

  await documentReferencer.update(data);
}

Future<void> deleteNote({
  required String docId,
}) async {
  DocumentReference documentReferencer = _mainCollection.doc(docId);

  await documentReferencer.delete();
}

Stream<QuerySnapshot> readNotes() {
  var notesItemCollection =
      _mainCollection.where('uid', isEqualTo: _auth.currentUser!.uid);

  return notesItemCollection.snapshots();
}