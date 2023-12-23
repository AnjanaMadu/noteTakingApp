import 'package:firebase_auth/firebase_auth.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;

Future<UserCredential> signInAnonymously() async {
  UserCredential userCredential = await _auth.signInAnonymously();
  return userCredential;
}

Future<void> signOut() async {
  await _auth.signOut();
}