// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:game_app/components/custom_awesome_dialogbox.dart';
import 'package:game_app/controllers/category_controller.dart';
import 'package:game_app/controllers/db_controller.dart';
import 'package:game_app/models/objects.dart';
import 'package:game_app/utils/util_functions.dart';
import 'package:game_app/views/authentication/login_screen/login_screen.dart';
import 'package:game_app/views/category_screens/catergory_list.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

class CategoryProvider extends ChangeNotifier {
  //Database controller object
  final DatabaseController _databaseController = DatabaseController();

  final CategoryController _categoryController = CategoryController();

  //UserModel object
  late UserModel _userModel;
  //Get usermodel data for identify user
  UserModel get userModel => _userModel;

  late CategoryModel _categoryModel;
  CategoryModel get categoryModelData => _categoryModel;

  //For get user data
  late User _user;
  //Returning firebase user  objects
  User get user => _user;

  //create variables
  final _name = TextEditingController();
  bool _isLoading = false;
  final ImagePicker _picker = ImagePicker();

  //get values
  TextEditingController get categoryName => _name;
  bool get isLoading => _isLoading;

  //Image file
  File _image = File("");
  //Get image file
  File get getImg => _image;

  //For edit and delete id
  late String _cateId;
  String get SelectedId => _cateId;

  void changeId(cateId) {
    _cateId = cateId;
    Logger().i(_cateId);
  }

  Future<void> takePhoto(ImageSource source) async {
    try {
      final XFile? pickedPhoto =
          await _picker.pickImage(source: ImageSource.camera);
      if (pickedPhoto != null) {
        _image = File(pickedPhoto.path);
        Logger().i(pickedPhoto.path);
        notifyListeners();
      } else {
        Logger().e("No Image Selected");
      }
    } catch (e) {
      Logger().e(e);
    }
  }

  Future<void> takeImage(ImageSource source) async {
    try {
      final XFile? pickedImage =
          await _picker.pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        _image = File(pickedImage.path);
        Logger().i(pickedImage.path);

        notifyListeners();
      } else {
        Logger().e("No Image Selected");
      }
    } catch (e) {
      Logger().e(e);
    }
  }

  //Change Loading State
  void setLoading([bool val = false]) {
    _isLoading = val;
    notifyListeners();
  }

  //Input validation add
  bool inputValidation() {
    var isValid = false;
    if (_name.text.isEmpty) {
      isValid = false;
    } else {
      isValid = true;
    }
    return isValid;
  }

  //add Category
  Future<void> CategoryState(BuildContext context) async {
    try {
      if (inputValidation()) {
        setLoading(true);
        FirebaseAuth.instance.authStateChanges().listen((User? user) async {
          if (user == null) {
            UtilFunction.navigateTo(context, const LogInScreen());
          } else {
            _user = user;
            notifyListeners();
            await fetchUserData(user.uid);
            await _categoryController.saveCategory(
              user.uid,
              _name.text,
              _image,
            );
            _name.clear();
            _image = File("");
            DialogBox().dialogbox(
              context,
              DialogType.SUCCES,
              'Added Data',
              'Entered Information',
              () {
                UtilFunction.navigateTo(context, CatergoryList());
              },
            );
          }
        });

        setLoading();
      } else {
        setLoading();
        DialogBox().dialogbox(
          context,
          DialogType.ERROR,
          'Invalidated Data',
          'Please Enter Correct Information',
          () {},
        );
      }
    } catch (e) {
      setLoading();
      Logger().e(e);
    }
  }

  //get user data in user model
  Future<void> fetchUserData(String id) async {
    _userModel = (await _databaseController.getUserData(id))!;
    notifyListeners();
  }
}
