import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game_app/components/custom_animation.dart';
import 'package:game_app/components/custom_backbutton.dart';
import 'package:game_app/components/custom_game_navigation_row.dart';
import 'package:game_app/components/custom_lable_box.dart';
import 'package:game_app/components/custom_switch_btn.dart';
import 'package:game_app/components/custom_text.dart';
import 'package:game_app/providers/game/game_two_provider.dart';
import 'package:game_app/utils/app_colors.dart';
import 'package:game_app/utils/constants.dart';
import 'package:game_app/utils/util_functions.dart';
import 'package:provider/provider.dart';

class GameTwo extends StatefulWidget {
  const GameTwo({Key? key}) : super(key: key);

  @override
  State<GameTwo> createState() => _GameTwoState();
}

class _GameTwoState extends State<GameTwo> {
  bool isPlaying = false;
  final controller = ConfettiController();

  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    controller.addListener(() {
      setState(() {
        isPlaying = controller.state == ConfettiControllerState.playing;
      });
    });
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
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
                    Consumer<GameTwoProvider>(
                      builder: (context, value, child) {
                        return Stack(
                          children: [
                            //Background
                            Image.asset(
                              Constants.gameAssets('gamebg.png'),
                              width: size.width * 0.99,
                              height: size.height * 0.65,
                            ),

                            //Rectangel
                            Positioned(
                              bottom: 0,
                              left: 10,
                              right: 10,
                              child: Image.asset(
                                Constants.gameAssets('rec.jpg'),
                                width: size.width,
                              ),
                            ),

                            //Train png
                            Positioned(
                              bottom: 30,
                              left: 20,
                              child: Image.asset(
                                Constants.gameAssets('train.png'),
                                width: 250,
                              ),
                            ),

                            //Main Boxes
                            CustomLableBox(
                              color: (value.tPress == true) ? gameBtn : kwhite,
                              top: 30,
                              left: 250,
                              letter: "t",
                            ),
                            CustomLableBox(
                              color: (value.rPress == true) ? gameBtn : kwhite,
                              top: 30,
                              left: 300,
                              letter: "r",
                            ),
                            CustomLableBox(
                              color: (value.aPress == true) ? gameBtn : kwhite,
                              top: 30,
                              left: 350,
                              letter: "a",
                            ),
                            CustomLableBox(
                              color: (value.iPress == true) ? gameBtn : kwhite,
                              top: 30,
                              left: 400,
                              letter: "i",
                            ),
                            CustomLableBox(
                              color: (value.nPress == true) ? gameBtn : kwhite,
                              top: 30,
                              left: 450,
                              letter: "n",
                            ),

                            //Letter Boxes
                            (value.tPress == true)
                                ? Text(" ")
                                : CustomLableBox(
                                    color: gameBtn,
                                    top: 180,
                                    left: 500,
                                    letter: "t",
                                    ontap: () {
                                      value.changeT();
                                    },
                                  ),
                            (value.rPress == true)
                                ? Text(" ")
                                : CustomLableBox(
                                    color: gameBtn,
                                    top: 30,
                                    left: 600,
                                    letter: "r",
                                    ontap: () {
                                      value.changeR();
                                    },
                                  ),
                            (value.aPress == true)
                                ? Text(" ")
                                : CustomLableBox(
                                    color: gameBtn,
                                    top: 120,
                                    left: 580,
                                    letter: "a",
                                    ontap: () {
                                      value.changeA();
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
                            (value.nPress == true)
                                ? Text(" ")
                                : CustomLableBox(
                                    color: gameBtn,
                                    top: 180,
                                    left: 400,
                                    letter: "n",
                                    ontap: () {
                                      value.changeN();
                                      if (isPlaying == false) {
                                        controller.play();
                                      }
                                    },
                                  ),

                            CustomGameNavigationRow(
                              onNextPress: () {
                                if (value.nPress == true) {
                                  value.tPress = false;
                                  value.rPress = false;
                                  value.aPress = false;
                                  value.iPress = false;
                                  value.nPress = false;
                                }
                              },
                              onBackPress: () {
                                if (value.nPress == true) {
                                  value.tPress = false;
                                  value.rPress = false;
                                  value.aPress = false;
                                  value.iPress = false;
                                  value.nPress = false;
                                }
                                UtilFunction.goBack(context);
                              },
                            ),
                          ],
                        );
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
