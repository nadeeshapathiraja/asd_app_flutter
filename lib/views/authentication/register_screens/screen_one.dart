import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:game_app/components/custom_button.dart';
import 'package:game_app/components/custom_input.dart';
import 'package:game_app/components/custom_navbar.dart';
import 'package:game_app/components/custom_text.dart';
import 'package:game_app/providers/auth/register_provider.dart';
import 'package:game_app/utils/app_colors.dart';
import 'package:game_app/utils/constants.dart';
import 'package:provider/provider.dart';

class RegisterScreenOne extends StatefulWidget {
  const RegisterScreenOne({Key? key}) : super(key: key);

  @override
  _RegisterScreenOneState createState() => _RegisterScreenOneState();
}

class _RegisterScreenOneState extends State<RegisterScreenOne> {
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
                          text: "Let's Create\na Account",
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
                          controller: value.getMobile,
                          lableText: "Mobile Number",
                          inputType: TextInputType.number,
                        ),
                        const SizedBox(height: 20),
                        CustomInput(
                          controller: value.getPassword,
                          lableText: "Password",
                          isObsecure: value.isObsecure1,
                          iconBtn: IconButton(
                            onPressed: () {
                              value.changeObscure1();
                            },
                            icon: Icon(
                              value.isObsecure1
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        CustomInput(
                          controller: value.getConfirmPassword,
                          lableText: "Confirm Password",
                          isObsecure: value.isObsecure2,
                          iconBtn: IconButton(
                            onPressed: () {
                              value.changeObscure2();
                            },
                            icon: Icon(
                              value.isObsecure2
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                        ),
                        const SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomButton(
                              isLoading: value.isLoading,
                              size: size,
                              textValue: "Sign Up ",
                              onTap: () {
                                value.RegisterState(context);
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
