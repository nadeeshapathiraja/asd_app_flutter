import 'package:flutter/material.dart';
import 'package:game_app/components/custom_button.dart';
import 'package:game_app/components/custom_input.dart';
import 'package:game_app/components/custom_navbar.dart';
import 'package:game_app/components/custom_text.dart';
import 'package:game_app/utils/app_colors.dart';
import 'package:game_app/utils/constants.dart';
import 'package:game_app/utils/util_functions.dart';
import 'package:game_app/views/authentication/reset_pasword_screen/reset_password_screen.dart';

class FrogotPassword extends StatefulWidget {
  const FrogotPassword({Key? key}) : super(key: key);

  @override
  _FrogotPasswordState createState() => _FrogotPasswordState();
}

class _FrogotPasswordState extends State<FrogotPassword> {
  final TextEditingController _mobileNumber = TextEditingController();
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
                image: AssetImage(
                  Constants.imageAssets("bg.jpg"),
                ),
                fit: BoxFit.fill,
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
                      text: "Forgot\nthe password?",
                      fontsize: 40,
                      color: darkColor,
                    ),
                    const SizedBox(height: 30),
                    const CustomText(
                      text:
                          "No problem. Enter your mobile number\nto get your reset code",
                      fontsize: 18,
                      color: darkColor,
                    ),
                    const SizedBox(height: 50),
                    Column(
                      children: [
                        CustomInput(
                          controller: _mobileNumber,
                          lableText: "Mobile number",
                        ),
                        const SizedBox(height: 60),
                        CustomButton(
                          size: size,
                          textValue: "Send",
                          onTap: () {
                            UtilFunction.navigateTo(
                                context, const ResetPasswordScreen());
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
