// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:game_app/components/custom_awesome_dialogbox.dart';
import 'package:game_app/controllers/category_controller.dart';
import 'package:game_app/utils/util_functions.dart';
import 'package:game_app/views/category_screens/catergory_list.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

class CategoryProvider extends ChangeNotifier {
  final CategoryController _categoryController = CategoryController();
  final ImagePicker _picker = ImagePicker();

  final _name = TextEditingController();
  bool _isLoading = false;

  TextEditingController get catergoryName => _name;

  //For get user data
  late User _user;

  //Returning firebase user  objects
  User get user => _user;

  //Get all Values in Category screen
  TextEditingController get getName => _name;
  bool get isLoading => _isLoading;

  late PickedFile _imageFile;

  PickedFile get imageFile => _imageFile;

  //Image file
  File _image = File("");
  //Get image file
  File get getImg => _image;

  //Audio File
  String _audio = "Test";

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
        await CategoryController().saveCategory(
          // user.uid,
          "1",
          _name.text,
          _image,
          _audio,
        );
        DialogBox().dialogbox(
          context,
          DialogType.SUCCES,
          'Added Data',
          'Entered Information',
          () {
            UtilFunction.navigateTo(context, CatergoryList());
          },
        );
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
      DialogBox().dialogbox(
        context,
        DialogType.ERROR,
        'Error',
        e.toString(),
        () {},
      );
    }
  }
}
