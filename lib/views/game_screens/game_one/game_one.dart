import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:game_app/components/custom_animation.dart';
import 'package:game_app/components/custom_backbutton.dart';
import 'package:game_app/components/custom_game_navigation_row.dart';
import 'package:game_app/components/custom_lable_box.dart';
import 'package:game_app/components/custom_switch_btn.dart';
import 'package:game_app/components/custom_text.dart';
import 'package:game_app/providers/game/game_one_provider.dart';
import 'package:game_app/utils/app_colors.dart';
import 'package:game_app/utils/constants.dart';
import 'package:game_app/utils/util_functions.dart';
import 'package:game_app/views/game_screens/game_three/game_three.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class GameOne extends StatefulWidget {
  const GameOne({Key? key}) : super(key: key);

  @override
  State<GameOne> createState() => _GameOneState();
}

class _GameOneState extends State<GameOne> {
  bool isPlaying = false;
  final controller = ConfettiController();

  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        isPlaying = controller.state == ConfettiControllerState.playing;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

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
                    Consumer<GameOneProvider>(
                      builder: (context, value, child) {
                        return Stack(
                          children: [
                            //Background
                            Image.asset(
                              Constants.gameAssets('gamebg.png'),
                              width: size.width * 0.99,
                              height: size.height * 0.65,
                            ),

                            //Cloud png
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

                            //Main Boxes
                            CustomLableBox(
                              color: (value.bPress == true) ? gameBtn : kwhite,
                              top: 30,
                              left: 250,
                              letter: "b",
                            ),
                            CustomLableBox(
                              color: (value.iPress == true) ? gameBtn : kwhite,
                              top: 30,
                              left: 300,
                              letter: "i",
                            ),
                            CustomLableBox(
                              color: (value.rPress == true) ? gameBtn : kwhite,
                              top: 30,
                              left: 350,
                              letter: "r",
                            ),
                            CustomLableBox(
                              color: (value.dPress == true) ? gameBtn : kwhite,
                              top: 30,
                              left: 400,
                              letter: "d",
                            ),

                            //Letter Boxes
                            (value.bPress == true)
                                ? Text(" ")
                                : CustomLableBox(
                                    color: gameBtn,
                                    top: 180,
                                    left: 400,
                                    letter: "b",
                                    ontap: () {
                                      value.changeB();
                                      print("b press");
                                    },
                                  ),
                            (value.iPress == true)
                                ? Text(" ")
                                : CustomLableBox(
                                    color: gameBtn,
                                    top: 150,
                                    left: 300,
                                    letter: "i",
                                    ontap: () {
                                      value.changeI();
                                    },
                                  ),
                            (value.rPress == true)
                                ? Text(" ")
                                : CustomLableBox(
                                    color: gameBtn,
                                    top: 70,
                                    left: 500,
                                    letter: "r",
                                    ontap: () {
                                      value.changeR();
                                    },
                                  ),
                            (value.dPress == true)
                                ? Text(" ")
                                : CustomLableBox(
                                    color: gameBtn,
                                    top: 150,
                                    left: 500,
                                    letter: "d",
                                    ontap: () {
                                      value.changeD();
                                      if (value.dPress == true) {
                                        if (isPlaying == false) {
                                          controller.play();
                                        }
                                      }
                                    },
                                  ),

                            //Bird png
                            Positioned(
                              bottom: 20,
                              left: 20,
                              child: Image.asset(
                                Constants.gameAssets('bird.png'),
                                width: 200,
                              ),
                            ),
                            // CustomGameNavigationRow(
                            //   onBackPress: () {
                            //     value.bPress = false;
                            //     value.iPress = false;
                            //     value.rPress = false;
                            //     value.dPress = false;
                            //     UtilFunction.goBack(context);
                            //   },
                            //   onNextPress: () {
                            //     if (value.dPress == true) {
                            //       value.bPress = false;
                            //       value.iPress = false;
                            //       value.rPress = false;
                            //       value.dPress = false;
                            //       UtilFunction.navigateTo(context, GameThree());
                            //     }
                            //   },
                            // ),
                          ],
                        );
                      },
                    ),
                    CustomGameNavigationRow(
                      onBackPress: () {
                        UtilFunction.goBack(context);
                      },
                      onNextPress: () {
                        Logger().i(
                            Provider.of<GameOneProvider>(context, listen: false)
                                .clickCount);
                        UtilFunction.navigateTo(context, GameThree());
                      },
                    ),
                    CustomAnimation(controller: controller),
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
