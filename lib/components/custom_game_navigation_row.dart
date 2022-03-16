import 'package:flutter/material.dart';
import 'package:game_app/utils/constants.dart';
import 'package:game_app/utils/util_functions.dart';

class CustomGameNavigationRow extends StatelessWidget {
  const CustomGameNavigationRow({
    Key? key,
    required this.onNextPress,
  }) : super(key: key);

  final Function() onNextPress;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 20,
      bottom: 10,
      child: Row(
        children: [
          RotationTransition(
            turns: new AlwaysStoppedAnimation(180 / 360),
            child: InkWell(
              onTap: () {
                UtilFunction.goBack(context);
              },
              child: Image.asset(
                Constants.iconAssets('arrow.png'),
                width: 50,
              ),
            ),
          ),
          SizedBox(width: 10),
          InkWell(
            onTap: onNextPress,
            child: Image.asset(
              Constants.iconAssets('arrow.png'),
              width: 50,
            ),
          ),
        ],
      ),
    );
  }
}
