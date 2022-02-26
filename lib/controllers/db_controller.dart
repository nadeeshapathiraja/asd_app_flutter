import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:game_app/models/objects.dart';
import 'package:logger/logger.dart';

class DatabaseController {
  //Firestore inctanec create
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Create a CollectionReference called users that references the firestore collection
  CollectionReference users = FirebaseFirestore.instance.collection('users');

//Store user data
  Future<void> saveUserData(String uid, String email, String phone) {
    // Call the user's CollectionReference to add a new user
    return users
        .doc(uid)
        .set({
          'uid': uid,
          'email': email,
          'phone': phone,
          'username': null,
          'age': null,
          'asd_level': null
        })
        .then((value) => Logger().d("User Added"))
        .catchError(
          (error) => Logger().e("Failed to add user: $error"),
        );
  }

  //Get User data
  Future<UserModel?> getUserData(String id) async {
    try {
      DocumentSnapshot snapshotData = await users.doc(id).get();
      // Logger().i(snapshotData.data());

      //Map data
      UserModel userModel =
          UserModel.fromJson(snapshotData.data() as Map<String, dynamic>);
      Logger().i(userModel.email);
      return userModel;
    } catch (e) {
      Logger().e(e);
    }
  }
}
