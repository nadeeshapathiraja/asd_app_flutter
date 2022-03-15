import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:game_app/components/custom_backbutton.dart';
import 'package:game_app/components/custom_lable_box.dart';
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
                        CloudImage(
                          bottom: 10,
                          left: 100,
                        ),
                        CloudImage(
                          top: 30,
                          left: 50,
                        ),
                        CloudImage(
                          top: 130,
                          left: 220,
                        ),
                        CloudImage(
                          top: 10,
                          left: 400,
                        ),
                        CloudImage(
                          bottom: 10,
                          left: 400,
                        ),
                        CustomLableBox(
                          color: kwhite,
                          top: 30,
                          left: 250,
                          letter: "b",
                        ),
                        CustomLableBox(
                          color: kwhite,
                          top: 30,
                          left: 300,
                          letter: "i",
                        ),
                        CustomLableBox(
                          color: kwhite,
                          top: 30,
                          left: 350,
                          letter: "r",
                        ),
                        CustomLableBox(
                          color: kwhite,
                          top: 30,
                          left: 400,
                          letter: "d",
                        ),
                        CustomLableBox(
                          color: gameBtn,
                          top: 150,
                          left: 500,
                          letter: "d",
                          ontap: () {},
                        ),
                        CustomLableBox(
                          color: gameBtn,
                          top: 70,
                          left: 500,
                          letter: "r",
                          ontap: () {},
                        ),
                        CustomLableBox(
                          color: gameBtn,
                          top: 180,
                          left: 400,
                          letter: "b",
                          ontap: () {},
                        ),
                        CustomLableBox(
                          color: gameBtn,
                          top: 150,
                          left: 300,
                          letter: "i",
                          ontap: () {},
                        ),
                        Positioned(
                          bottom: 20,
                          left: 20,
                          child: Image.asset(
                            Constants.gameAssets('bird.png'),
                            width: 200,
                          ),
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

class CloudImage extends StatelessWidget {
  const CloudImage({
    Key? key,
    this.bottom,
    this.left,
    this.right,
    this.top,
  }) : super(key: key);

  final double? bottom;
  final double? left;
  final double? right;
  final double? top;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: bottom,
      left: left,
      right: right,
      top: top,
      child: Image.asset(
        Constants.gameAssets('cloud.png'),
        width: 80,
      ),
    );
  }
}
