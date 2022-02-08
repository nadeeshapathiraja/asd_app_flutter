import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseController {
  //Firestore inctanec create
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Create a CollectionReference called users that references the firestore collection
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> saveUserData(String uid, String email, String phone) {
    // Call the user's CollectionReference to add a new user
    return users
        .doc(uid)
        .set({
          'uid': uid,
          'email': email,
          'phone': phone,
        })
        .then((value) => print("User Added"))
        .catchError(
          (error) => print("Failed to add user: $error"),
        );
  }
}
