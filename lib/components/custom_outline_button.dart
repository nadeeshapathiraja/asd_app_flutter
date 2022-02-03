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
  }) : super(key: key);

  final Size size;
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: CustomText(
        text: 'Add New Category',
        fontWeight: FontWeight.w600,
        fontsize: 20,
        color: primaryColor,
      ),
      style: OutlinedButton.styleFrom(
        primary: primaryColor,
        minimumSize: Size(size.width, 60),
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
      onPressed: () {},
    );
  }
}
