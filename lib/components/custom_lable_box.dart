import 'package:flutter/material.dart';
import 'package:game_app/components/custom_text.dart';
import 'package:game_app/utils/app_colors.dart';

class CustomLableBox extends StatelessWidget {
  const CustomLableBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 230,
      top: 40,
      child: Container(
        width: 50,
        height: 50,
        color: kwhite,
        child: Center(
          child: CustomText(
            text: "b",
            fontsize: 40,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
