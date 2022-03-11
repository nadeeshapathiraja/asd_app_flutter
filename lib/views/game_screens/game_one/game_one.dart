import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:game_app/components/custom_backbutton.dart';
import 'package:game_app/components/custom_switch_btn.dart';
import 'package:game_app/components/custom_text.dart';
import 'package:game_app/utils/app_colors.dart';
import 'package:game_app/utils/constants.dart';

class GameOne extends StatefulWidget {
  const GameOne({Key? key}) : super(key: key);

  @override
  State<GameOne> createState() => _GameOneState();
}

class _GameOneState extends State<GameOne> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Constants.imageAssets("bg.jpg")),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
                right: 10.0,
                top: 10.0,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomSwitchBtn(),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        //Custom Back button
                        CustomBackButton(),
                        SizedBox(
                          width: size.width * 0.3,
                        ),
                        CustomText(
                          text: "Let's Play",
                          fontWeight: FontWeight.w700,
                          fontsize: 40,
                          color: darkColor,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Stack(
                      children: [
                        Image.asset(
                          Constants.gameAssets('gamebg.png'),
                          width: size.width * 0.99,
                          height: size.height * 0.65,
                        ),
                      ],
                    )
                  ],
                ),
              )),
        ),
      ),
    ));
  }
}
