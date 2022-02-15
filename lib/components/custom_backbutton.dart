import 'package:flutter/material.dart';
import 'package:game_app/utils/constants.dart';
import 'package:game_app/utils/util_functions.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        UtilFunction.goBack(context);
      },
      child: Image.asset(
        Constants.iconAssets("backbtn.png"),
        width: 60,
      ),
    );
  }
}
