import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:game_app/components/custom_button.dart';
import 'package:game_app/components/custom_navbar.dart';
import 'package:game_app/components/custom_text.dart';
import 'package:game_app/utils/app_colors.dart';
import 'package:game_app/utils/constants.dart';
import 'package:game_app/utils/util_functions.dart';
import 'package:game_app/views/authentication/login_screen/login_screen.dart';

class RegisterScreenThree extends StatefulWidget {
  const RegisterScreenThree({Key? key}) : super(key: key);

  @override
  _RegisterScreenThreeState createState() => _RegisterScreenThreeState();
}

enum level { low, mild, high }

class _RegisterScreenThreeState extends State<RegisterScreenThree> {
  level? _character = level.low;
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
                      text: "Let us know the\nlevel of ASD",
                      fontsize: 40,
                      color: darkColor,
                    ),
                    const SizedBox(height: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ListTile(
                          title: const CustomText(
                            text: "Low",
                            color: primaryColor,
                            fontsize: 18,
                          ),
                          leading: Radio<level>(
                            fillColor: MaterialStateColor.resolveWith(
                                (states) => darkColor),
                            focusColor: MaterialStateColor.resolveWith(
                                (states) => primaryColor),
                            value: level.low,
                            groupValue: _character,
                            onChanged: (level? value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: const CustomText(
                            text: "Mild",
                            color: primaryColor,
                            fontsize: 18,
                          ),
                          leading: Radio<level>(
                            fillColor: MaterialStateColor.resolveWith(
                                (states) => darkColor),
                            focusColor: MaterialStateColor.resolveWith(
                                (states) => primaryColor),
                            value: level.mild,
                            groupValue: _character,
                            onChanged: (level? value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: const CustomText(
                            text: "High",
                            color: primaryColor,
                            fontsize: 18,
                          ),
                          leading: Radio<level>(
                            fillColor: MaterialStateColor.resolveWith(
                                (states) => darkColor),
                            focusColor: MaterialStateColor.resolveWith(
                                (states) => primaryColor),
                            value: level.high,
                            groupValue: _character,
                            onChanged: (level? value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                          size: size,
                          textValue: "Create Now",
                          onTap: () {
                            UtilFunction.navigateTo(
                                context, const LogInScreen());
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
}
