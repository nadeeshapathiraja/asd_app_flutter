import 'package:flutter/material.dart';
import 'package:game_app/components/custom_text.dart';
import 'package:game_app/utils/app_colors.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({
    Key? key,
    required this.size,
    required this.text,
    this.fontSize = 20,
    this.fontWeight = FontWeight.w600,
    required this.height,
    required this.width,
    required this.onTap,
  }) : super(key: key);

  final Size size;
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final double width;
  final double height;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: CustomText(
        text: text,
        fontWeight: fontWeight,
        fontsize: fontSize,
        color: primaryColor,
      ),
      style: OutlinedButton.styleFrom(
        primary: primaryColor,
        minimumSize: Size(width, height),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        side: BorderSide(
          color: primaryColor,
          width: 1,
        ),
      ),
      onPressed: onTap,
    );
  }
}
