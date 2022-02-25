import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:game_app/controllers/db_controller.dart';
import 'package:game_app/controllers/user_controller.dart';
import 'package:game_app/models/objects.dart';
import 'package:game_app/utils/util_functions.dart';
import 'package:game_app/views/authentication/login_screen/login_screen.dart';
import 'package:game_app/views/home_screen/home_screen.dart';
import 'package:logger/logger.dart';

class UserProvider extends ChangeNotifier {
  final UserController _userController = UserController();

  //Database controller object
  final DatabaseController _databaseController = DatabaseController();

  //UserModel object
  late UserModel _userModel;

  //Get usermodel data for identify user
  UserModel get userModel => _userModel;

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

  //Store user data in user model
  Future<void> fetchUserData(String id) async {
    _userModel = (await _databaseController.getUserData(id))!;
    notifyListeners();
  }
}
