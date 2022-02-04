import 'package:flutter/material.dart';
import 'package:game_app/components/custom_button.dart';
import 'package:game_app/components/custom_outline_button.dart';
import 'package:game_app/utils/app_colors.dart';
import 'package:game_app/utils/util_functions.dart';

class CustomDialogbox extends StatelessWidget {
  const CustomDialogbox({
    Key? key,
    required this.size,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  final Size size;
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        color: kwhite,
        height: 200.0,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: darkColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomOutlineButton(
                    size: size,
                    text: "No",
                    height: 40,
                    width: 100,
                    onTap: () {
                      UtilFunction.goBack(context);
                    },
                  ),
                  SizedBox(width: 20),
                  CustomButton(
                    size: size,
                    onTap: onTap,
                    textValue: "Yes",
                    width: 100,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
