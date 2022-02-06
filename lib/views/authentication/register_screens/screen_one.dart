import 'package:animate_do/animate_do.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:game_app/components/custom_button.dart';
import 'package:game_app/components/custom_input.dart';
import 'package:game_app/components/custom_navbar.dart';
import 'package:game_app/components/custom_text.dart';
import 'package:game_app/utils/app_colors.dart';
import 'package:game_app/utils/constants.dart';

class RegisterScreenOne extends StatefulWidget {
  const RegisterScreenOne({Key? key}) : super(key: key);

  @override
  _RegisterScreenOneState createState() => _RegisterScreenOneState();
}

class _RegisterScreenOneState extends State<RegisterScreenOne> {
  var _isObsecure1 = true;
  var _isObsecure2 = true;
  final _email = TextEditingController();
  final _mobileNumber = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: FadeInLeft(
          child: Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Constants.imageAssets("bg.jpg")),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomNavbar(),
                    const SizedBox(height: 20),
                    const CustomText(
                      text: "Let's Create\na Account",
                      fontsize: 40,
                      color: darkColor,
                    ),
                    const SizedBox(height: 30),
                    CustomInput(
                      controller: _email,
                      lableText: "Email",
                    ),
                    const SizedBox(height: 20),
                    CustomInput(
                      controller: _mobileNumber,
                      lableText: "Mobile Number",
                    ),
                    const SizedBox(height: 20),
                    CustomInput(
                      controller: _password,
                      lableText: "Password",
                      isObsecure: _isObsecure1,
                      iconBtn: IconButton(
                        onPressed: () {
                          setState(() {
                            _isObsecure1 = !_isObsecure1;
                          });
                          print(_isObsecure1);
                        },
                        icon: Icon(_isObsecure1
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                    const SizedBox(height: 30),
                    CustomInput(
                      controller: _confirmPassword,
                      lableText: "Confirm Password",
                      isObsecure: _isObsecure2,
                      iconBtn: IconButton(
                        onPressed: () {
                          setState(() {
                            _isObsecure2 = !_isObsecure2;
                          });
                        },
                        icon: Icon(_isObsecure2
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                          size: size,
                          textValue: "Sign Up ",
                          onTap: () {
                            if (inputValidation()) {
                              print("Validated Data");
                            } else {
                              print("Invalidated Data");
                            }
                            // UtilFunction.navigateTo(
                            //     context, const RegisterScreenTwo());
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

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
}
