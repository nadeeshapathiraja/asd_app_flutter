import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:game_app/components/custom_awesome_dialogbox.dart';
import 'package:game_app/controllers/db_controller.dart';
import 'package:game_app/utils/util_functions.dart';
import 'package:game_app/views/authentication/login_screen/login_screen.dart';
import 'package:game_app/views/home_screen/home_screen.dart';

class AuthController {
  //Create Firebade auth instance
  FirebaseAuth auth = FirebaseAuth.instance;

  //User registration Function
  Future<void> registerUser(
    BuildContext context,
    String email,
    String password,
    String phone,
  ) async {
    try {
      //Create User in Autendication
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user!.uid.isEmpty) {
        //Save user data in firestore database
        await DatabaseController().saveUserData(
          userCredential.user!.uid,
          email,
          phone,
        );
      }

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

  //User Login Function
  Future<void> loginUser(
      String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      UtilFunction.navigateTo(context, HomeScreen());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        DialogBox().dialogbox(
          context,
          DialogType.ERROR,
          'User not found',
          'No user found for that email.',
          () {},
        );
      } else if (e.code == 'wrong-password') {
        DialogBox().dialogbox(
          context,
          DialogType.ERROR,
          'Wrong Passord',
          'Wrong password provided for that user.',
          () {},
        );
      }
    }
  }

//Reset Passord Function
  Future<void> resetPasswordUser(BuildContext context, String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      DialogBox().dialogbox(context, DialogType.SUCCES,
          'Your Email sent Success', 'Please check your Email', () async {
        await LaunchApp.openApp(
          androidPackageName: 'com.google.android.gm',
          openStore: true,
        );
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-email") {
        DialogBox().dialogbox(
          context,
          DialogType.ERROR,
          'Invalid Email',
          'Please enter valid Email',
          () {},
        );
      } else {
        DialogBox().dialogbox(
          context,
          DialogType.ERROR,
          'Error',
          "Check Your Email",
          () {},
        );
      }
    } catch (e) {}
  }
}
