import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('notes');

Future<void> addNote({
  required String title,
  required String description,
}) async {
  DocumentReference documentReferencer = _mainCollection.doc();

  Map<String, dynamic> data = <String, dynamic>{
    "title": title,
    "description": description,
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
  };

  await documentReferencer.update(data);
}

Future<void> deleteNote({
  required String docId,
}) async {
  DocumentReference documentReferencer = _mainCollection.doc(docId);

  await documentReferencer.delete();
}
