import 'package:flutter/material.dart';
import 'package:game_app/components/custom_text.dart';
import 'package:game_app/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.size,
    required this.onTap,
    required this.textValue,
  }) : super(key: key);

  final Size size;
  final Function() onTap;
  final String textValue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.width * 0.5,
        height: 40,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
            child: Text(
          textValue,
          style: TextStyle(
            color: kwhite,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        )),
      ),
    );
  }
}
