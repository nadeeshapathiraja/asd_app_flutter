import 'package:flutter/material.dart';
import 'package:game_app/components/custom_button.dart';
import 'package:game_app/components/custom_input.dart';
import 'package:game_app/components/custom_navbar.dart';
import 'package:game_app/components/custom_text.dart';
import 'package:game_app/utils/app_colors.dart';
import 'package:game_app/utils/constants.dart';
import 'package:game_app/utils/util_functions.dart';
import 'package:game_app/views/authentication/login_screen/login_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _resetCode = TextEditingController();
  final TextEditingController _newPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomNavbar(),
                    const SizedBox(height: 20),
                    const CustomText(
                      text: "Reset\nyour password",
                      fontsize: 40,
                      color: darkColor,
                    ),
                    const SizedBox(height: 30),
                    const CustomText(
                      text:
                          "It's simple, just enter your reset code\nand ne password",
                      fontsize: 18,
                      color: darkColor,
                    ),
                    const SizedBox(height: 50),
                    Column(
                      children: [
                        CustomInput(
                          controller: _resetCode,
                          lableText: "Enter reset code",
                        ),
                        const SizedBox(height: 20),
                        CustomInput(
                          controller: _newPassword,
                          lableText: "New Password",
                        ),
                        const SizedBox(height: 60),
                        CustomButton(
                          size: size,
                          textValue: "Send",
                          onTap: () {
                            UtilFunction.navigateTo(
                                context, const LogInScreen());
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
