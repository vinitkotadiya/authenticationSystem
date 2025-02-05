import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserRepository {
  void addData(collection, userData, doc) async {
    FirebaseFirestore users = FirebaseFirestore.instance;

    // Add a new document
    await users
        .collection(collection)
        .doc(doc)
        .set(userData)
        .whenComplete(() => SnackBar(
            content: Text("Your account is created"),
            backgroundColor: Color.fromRGBO(62, 255, 3, 0.098)))
        .catchError((error, stacktree) {
      SnackBar(
        content: Text("Something is wrong"),
        backgroundColor: Color.fromRGBO(233, 8, 8, 0.098),
      );
    });
  }

  void readData() async {
    late Future<DocumentSnapshot> user = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();
    user.then((value) {});
  }

  void updateData() async {
    DocumentReference userRef =
        FirebaseFirestore.instance.collection('users').doc('customID123');

    // Update specific fields
    await userRef.update({
      'age': 30, // Change age
    });

    // Or update multiple fields
    await userRef.update({
      'email': 'jane.smith.new@example.com',
      'name': 'Jane Doe',
    });
  }

  void deleteData() async {
    DocumentReference userRef =
        FirebaseFirestore.instance.collection('users').doc('customID123');

    // Delete the document
    await userRef.delete();
  }
}
