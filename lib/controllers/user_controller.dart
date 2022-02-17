import 'package:firebase_auth/firebase_auth.dart';

class UserController {
  //Logout function
  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
