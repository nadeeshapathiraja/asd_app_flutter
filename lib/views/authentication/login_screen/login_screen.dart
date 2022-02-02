import 'package:flutter/material.dart';
import 'package:game_app/components/custom_button.dart';
import 'package:game_app/components/custom_input.dart';
import 'package:game_app/components/custom_text.dart';
import 'package:game_app/utils/app_colors.dart';
import 'package:game_app/utils/constants.dart';
import 'package:game_app/utils/util_functions.dart';
import 'package:game_app/views/authentication/register_screens/screen_one.dart';
import 'package:game_app/views/authentication/reset_pasword_screen/frogot_passord_screen.dart';
import 'package:game_app/views/home_screen/home_screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomInput(
                  controller: _userName,
                  lableText: "User Name",
                ),
                const SizedBox(height: 20),
                CustomInput(
                  controller: _password,
                  lableText: "Passord",
                ),
                const SizedBox(height: 50),
                CustomButton(
                  size: size,
                  textValue: "Login",
                  onTap: () {
                    UtilFunction.navigateTo(context, HomeScreen());
                  },
                ),
                const SizedBox(height: 30),
                InkWell(
                  onTap: () {
                    UtilFunction.navigateTo(context, const FrogotPassword());
                  },
                  child: const CustomText(
                    text: "Forget Password?",
                    color: primaryColor,
                  ),
                ),
                const SizedBox(height: 30),
                InkWell(
                  onTap: () {
                    UtilFunction.navigateTo(context, const RegisterScreenOne());
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
          ),
        ),
      ),
    );
  }
}
