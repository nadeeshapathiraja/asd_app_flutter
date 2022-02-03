import 'package:flutter/material.dart';
import 'package:game_app/utils/constants.dart';
import 'package:game_app/utils/util_functions.dart';

class CustomNavbar extends StatelessWidget {
  const CustomNavbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            UtilFunction.goBack(context);
          },
          child: Image.asset(
            Constants.iconAssets("back.png"),
            width: 35,
            height: 35,
          ),
        )
      ],
    );
  }
}
