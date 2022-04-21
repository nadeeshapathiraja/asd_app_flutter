import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:game_app/components/custom_awesome_dialogbox.dart';
import 'package:game_app/controllers/db_controller.dart';
import 'package:game_app/controllers/item_controller.dart';
import 'package:game_app/models/objects.dart';
import 'package:game_app/utils/util_functions.dart';
import 'package:game_app/views/item_screens/item_list.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

import '../views/authentication/login_screen/login_screen.dart';

class ItemProvider extends ChangeNotifier {
  //Database controller object
  final DatabaseController _databaseController = DatabaseController();

  final ItemController _itemController = ItemController();

  //UserModel object
  late UserModel _userModel;
  //Get usermodel data for identify user
  UserModel get userModel => _userModel;
  //For get user data
  late User _user;
  //Returning firebase user  objects
  User get user => _user;

  final _name = TextEditingController();
  final _uid = TextEditingController();
  String _categoryId = "";
  final _audioFile = TextEditingController();
  bool _isLoading = false;
  final ImagePicker _picker = ImagePicker();
  String _categoryName = "";

  //Get all Values in Category screen
  TextEditingController get getName => _name;
  TextEditingController get getUserId => _uid;
  TextEditingController get getAudioFile => _audioFile;
  bool get isLoading => _isLoading;

  //Image file
  File _image = File("");
  //Get image file
  File get getItemImg => _image;

//Change selected Category Id
  void changeCategory(categoryID, categoryName) {
    _categoryId = categoryID;
    _categoryName = categoryName;
  }

  String get selectedId => _categoryId;
  String get selectedCategoryName => _categoryName;

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

  //add Item
  Future<void> ItemState(BuildContext context) async {
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

            if (inputValidation()) {
              await _itemController.saveItem(
                user.uid,
                _categoryId,
                _name.text,
                _image,
                _audioFile.text,
              );

              setLoading();
              DialogBox().dialogbox(
                context,
                DialogType.SUCCES,
                'Added Data',
                'Entered Information',
                () {
                  UtilFunction.navigateTo(context, ItemList());
                },
              );
              _name.clear();
              _image = File("");
              _audioFile.clear();
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

  //Store user data in user model
  Future<void> fetchUserData(String id) async {
    _userModel = (await _databaseController.getUserData(id))!;
    notifyListeners();
  }
}
