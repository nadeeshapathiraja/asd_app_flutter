import 'package:flutter/material.dart';
import 'package:game_app/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    Key? key,
    required this.size,
    required this.onTap,
    required this.textValue,
    this.width = 200,
  }) : super(key: key);

  final Size size;
  final Function() onTap;
  final String textValue;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: 40,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
            child: Text(
          textValue,
          style: const TextStyle(
            color: kwhite,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        )),
      ),
    );
  }
}
