import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:game_app/components/custom_button.dart';
import 'package:game_app/components/custom_input.dart';
import 'package:game_app/components/custom_navbar.dart';
import 'package:game_app/components/custom_text.dart';
import 'package:game_app/providers/auth/register_provider.dart';
import 'package:game_app/utils/app_colors.dart';
import 'package:game_app/utils/constants.dart';
import 'package:game_app/utils/util_functions.dart';
import 'package:game_app/views/authentication/register_screens/screen_three.dart';
import 'package:provider/provider.dart';

class RegisterScreenTwo extends StatefulWidget {
  const RegisterScreenTwo({Key? key}) : super(key: key);

  @override
  _RegisterScreenTwoState createState() => _RegisterScreenTwoState();
}

class _RegisterScreenTwoState extends State<RegisterScreenTwo> {
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
              child: Consumer<RegisterProvider>(
                builder: (context, value, child) {
                  return Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomNavbar(),
                        const SizedBox(height: 20),
                        const CustomText(
                          text: "A Little bit\nMore",
                          fontsize: 40,
                          color: darkColor,
                        ),
                        const SizedBox(height: 30),
                        CustomInput(
                          controller: value.getUserName,
                          lableText: "Who will be using the app?",
                        ),
                        const SizedBox(height: 20),
                        CustomInput(
                          controller: value.getAge,
                          lableText: "Age(Years)",
                          inputType: TextInputType.number,
                        ),
                        const SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomButton(
                              isLoading: value.isLoading,
                              size: size,
                              textValue: "Continue",
                              onTap: () {
                                UtilFunction.navigateTo(
                                    context, const RegisterScreenThree());
                              },
                            ),
                          ],
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
      ),
    );
  }
}
