import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:game_app/controllers/db_controller.dart';
import 'package:game_app/controllers/user_controller.dart';
import 'package:game_app/utils/util_functions.dart';
import 'package:game_app/views/authentication/login_screen/login_screen.dart';
import 'package:game_app/views/home_screen/home_screen.dart';
import 'package:logger/logger.dart';

class UserProvider extends ChangeNotifier {
  final UserController _userController = UserController();
  final DatabaseController _databaseController = DatabaseController();
  //For get user data
  late User _user;

  //Returning firebase user  objects
  User get user => _user;

  //Initialize user function
  Future<void> initializedUser(BuildContext context) async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user == null) {
        Logger().w('User is currently signed out!');
        UtilFunction.navigateTo(context, const LogInScreen());
      } else {
        Logger().d('User is signed in!');
        _user = user;
        notifyListeners();
        await fetchUserData(user.uid);
        UtilFunction.navigateTo(context, const HomeScreen());
      }
    });
  }

  //Google logout function
  Future<void> logout(BuildContext context) async {
    try {
      await _userController.logOut();
      UtilFunction.navigateTo(context, LogInScreen());
    } catch (e) {
      Logger().e(e);
    }
  }

  //Store user data
  Future<void> fetchUserData(String id) async {
    await _databaseController.getUserData(id);
  }
}
