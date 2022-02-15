import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

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
}
