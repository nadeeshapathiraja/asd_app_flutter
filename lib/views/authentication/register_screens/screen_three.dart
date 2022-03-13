import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:game_app/components/custom_button.dart';
import 'package:game_app/components/custom_navbar.dart';
import 'package:game_app/components/custom_text.dart';
import 'package:game_app/providers/auth/register_provider.dart';
import 'package:game_app/utils/app_colors.dart';
import 'package:game_app/utils/constants.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class RegisterScreenThree extends StatefulWidget {
  const RegisterScreenThree({Key? key}) : super(key: key);

  @override
  _RegisterScreenThreeState createState() => _RegisterScreenThreeState();
}

class _RegisterScreenThreeState extends State<RegisterScreenThree> {
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
                    child: SingleChildScrollView(
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
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                    (states) => darkColor,
                                  ),
                                  focusColor: MaterialStateColor.resolveWith(
                                    (states) => primaryColor,
                                  ),
                                  value: 'Low',
                                  groupValue: value.getCharacter,
                                  onChanged: (val) {
                                    Logger().w(val.toString());
                                    value.setCharactor(val.toString());
                                    // run krala balanna
                                  },
                                ),
                              ),
                              ListTile(
                                title: const CustomText(
                                  text: "Mild",
                                  color: primaryColor,
                                  fontsize: 18,
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => darkColor),
                                  focusColor: MaterialStateColor.resolveWith(
                                      (states) => primaryColor),
                                  value: 'Mild',
                                  groupValue: value.getCharacter,
                                  onChanged: (val) {
                                    value.setCharactor(val.toString());
                                  },
                                ),
                              ),
                              ListTile(
                                title: const CustomText(
                                  text: "High",
                                  color: primaryColor,
                                  fontsize: 18,
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => darkColor),
                                  focusColor: MaterialStateColor.resolveWith(
                                      (states) => primaryColor),
                                  value: 'High',
                                  groupValue: value.getCharacter,
                                  onChanged: (val) {
                                    value.setCharactor(val.toString());
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
                                isLoading: value.isLoading,
                                size: size,
                                textValue: "Create Now",
                                onTap: () {
                                  value.RegisterState(context);
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
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
