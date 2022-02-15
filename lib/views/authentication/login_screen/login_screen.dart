import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:game_app/components/custom_awesome_dialogbox.dart';
import 'package:game_app/components/custom_button.dart';
import 'package:game_app/components/custom_input.dart';
import 'package:game_app/components/custom_loader.dart';
import 'package:game_app/components/custom_text.dart';
import 'package:game_app/controllers/auth_controller.dart';
import 'package:game_app/providers/login_provider.dart';
import 'package:game_app/utils/app_colors.dart';
import 'package:game_app/utils/constants.dart';
import 'package:game_app/utils/util_functions.dart';
import 'package:game_app/views/authentication/register_screens/screen_one.dart';
import 'package:game_app/views/authentication/reset_pasword_screen/frogot_passord_screen.dart';
import 'package:provider/provider.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
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
            child: Consumer<LoginProvider>(
              builder: (context, value, child) {
                return Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(height: 20),
                      const CustomText(
                        text: "LogIn",
                        fontsize: 40,
                        color: darkColor,
                      ),
                      const SizedBox(height: 30),
                      CustomInput(
                        controller: value.getEmail,
                        lableText: "Email",
                      ),
                      const SizedBox(height: 20),
                      CustomInput(
                        controller: value.getPassword,
                        lableText: "Password",
                        isObsecure: value.isObsecure,
                        iconBtn: IconButton(
                          onPressed: () {
                            value.changeObscure();
                          },
                          icon: Icon(value.isObsecure
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                      ),
                      const SizedBox(height: 50),
                      value.isLoading
                          ? const CustomLoader()
                          : CustomButton(
                              size: size,
                              textValue: "Login",
                              onTap: () {
                                // if (inputValidation()) {
                                //   setState(() {
                                //     isLoading = true;
                                //   });
                                //   AuthController().loginUser(
                                //    value.getEmail.text,
                                //     value.getPassword.text,
                                //     context,
                                //   );
                                //   setState(() {
                                //     isLoading = false;
                                //   });
                                // } else {
                                //   DialogBox().dialogbox(
                                //     context,
                                //     DialogType.ERROR,
                                //     'Invalidated Data',
                                //     'Please Enter Correct Information',
                                //     () {},
                                //   );
                                // }
                              },
                            ),
                      const SizedBox(height: 30),
                      InkWell(
                        onTap: () {
                          UtilFunction.navigateTo(
                              context, const FrogotPassword());
                        },
                        child: const CustomText(
                          text: "Forget Password?",
                          color: primaryColor,
                        ),
                      ),
                      const SizedBox(height: 30),
                      InkWell(
                        onTap: () {
                          UtilFunction.navigateTo(
                              context, const RegisterScreenOne());
                        },
                        child: const CustomText(
                          text: "Signup Now",
                          color: darkColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

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
