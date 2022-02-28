import 'package:flutter/material.dart';
import 'package:game_app/components/custom_switch_btn.dart';
import 'package:game_app/utils/constants.dart';
import 'package:game_app/utils/util_functions.dart';

class CustomMainNavBar extends StatelessWidget {
  const CustomMainNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        ),
        CustomSwitchBtn(),
      ],
    );
  }
}
