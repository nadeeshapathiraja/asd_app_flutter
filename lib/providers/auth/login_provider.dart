import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:game_app/components/custom_awesome_dialogbox.dart';
import 'package:game_app/controllers/auth_controller.dart';
import 'package:logger/logger.dart';

class LoginProvider extends ChangeNotifier {
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _isObsecure = true;
  bool _isLoading = false;

//Get all Values in login screen
  TextEditingController get getEmail => _email;
  TextEditingController get getPassword => _password;
  bool get isObsecure => _isObsecure;
  bool get isLoading => _isLoading;

  //Change obsecre text
  void changeObscure() {
    _isObsecure = !_isObsecure;
    notifyListeners();
  }

  //Validate inputs
  bool inputValidation() {
    var isValid = false;
    if (_email.text.isEmpty || _password.text.isEmpty) {
      isValid = false;
    } else if (!EmailValidator.validate(_email.text)) {
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

  //Login function
  Future<void> LoginState(BuildContext context) async {
    try {
      if (inputValidation()) {
        setLoading(true);
        await AuthController().loginUser(
          _email.text,
          _password.text,
          context,
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
      Logger().e(e);
    }
  }
}
