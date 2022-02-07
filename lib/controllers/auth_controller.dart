import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:game_app/components/custom_awesome_dialogbox.dart';
import 'package:game_app/utils/util_functions.dart';
import 'package:game_app/views/authentication/login_screen/login_screen.dart';

class AuthController {
  //Create Firebade auth instance
  FirebaseAuth auth = FirebaseAuth.instance;

  //User registration Function
  Future<void> RegisterUser(
      BuildContext context, String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      DialogBox().dialogbox(
        context,
        DialogType.SUCCES,
        'Your registration Success',
        'Please Login Now',
        () {
          UtilFunction.navigateTo(context, LogInScreen());
        },
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        DialogBox().dialogbox(
          context,
          DialogType.ERROR,
          'Weak Password',
          'Please Use Strong Password',
          () {},
        );
      } else if (e.code == 'email-already-in-use') {
        DialogBox().dialogbox(
          context,
          DialogType.ERROR,
          'The account already exists',
          'Please Use another Email',
          () {},
        );
      }
    } catch (e) {
      print(e);
    }
  }
}
