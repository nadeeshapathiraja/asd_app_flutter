import 'package:flutter/material.dart';
import 'package:game_app/utils/constants.dart';

class CustomGameNavigationRow extends StatelessWidget {
  const CustomGameNavigationRow({
    Key? key,
  }) : super(key: key);

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
              onTap: () {},
              child: Image.asset(
                Constants.iconAssets('arrow.png'),
                width: 50,
              ),
            ),
          ),
          SizedBox(width: 10),
          InkWell(
            onTap: () {},
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
