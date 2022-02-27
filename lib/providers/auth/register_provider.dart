import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:game_app/components/custom_awesome_dialogbox.dart';
import 'package:game_app/controllers/auth_controller.dart';

class RegisterProvider extends ChangeNotifier {
  var _isObsecure1 = true;
  var _isObsecure2 = true;
  final _email = TextEditingController();
  final _mobileNumber = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();
  bool _isLoading = false;
  final _username = TextEditingController();
  final _age = TextEditingController();
  final _asd_level = TextEditingController();

  //Get all Values in Register screen
  TextEditingController get getEmail => _email;
  TextEditingController get getMobile => _mobileNumber;
  TextEditingController get getPassword => _password;
  TextEditingController get getConfirmPassword => _confirmPassword;
  bool get isObsecure1 => _isObsecure1;
  bool get isObsecure2 => _isObsecure2;
  bool get isLoading => _isLoading;
  TextEditingController get getUserName => _username;
  TextEditingController get getAge => _age;
  TextEditingController get getAsdLevel => _asd_level;

  //Change obsecre text in password
  void changeObscure1() {
    _isObsecure1 = !_isObsecure1;
    notifyListeners();
  }

  //Change obsecre text in confirm password
  void changeObscure2() {
    _isObsecure2 = !_isObsecure2;
    notifyListeners();
  }

//Input validation add
  bool inputValidation() {
    var isValid = false;
    if (_email.text.isEmpty ||
        _mobileNumber.text.isEmpty ||
        _password.text.isEmpty ||
        _confirmPassword.text.isEmpty) {
      isValid = false;
    } else if (!EmailValidator.validate(_email.text)) {
      isValid = false;
    } else if (_mobileNumber.text.length != 10) {
      isValid = false;
    } else if (_password.text != _confirmPassword.text) {
      isValid = false;
    } else {
      isValid = true;
    }
    return isValid;
  }

  //Change Loading State
  void setLoading([bool val = false]) {
    _isLoading = val;
    notifyListeners();
  }

  //Register user
  Future<void> RegisterState(BuildContext context) async {
    try {
      if (inputValidation()) {
        setLoading(true);
        await AuthController().registerUser(
          context,
          _email.text,
          _password.text,
          _mobileNumber.text,
          _username.text,
          _age.text,
          _asd_level.text,
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
    } catch (e) {}
  }
}
