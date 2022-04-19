import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:game_app/components/custom_animation.dart';
import 'package:game_app/components/custom_backbutton.dart';
import 'package:game_app/components/custom_game_navigation_row.dart';
import 'package:game_app/components/custom_lable_box.dart';
import 'package:game_app/components/custom_switch_btn.dart';
import 'package:game_app/components/custom_text.dart';
import 'package:game_app/providers/game/game_three_provider.dart';
import 'package:game_app/utils/app_colors.dart';
import 'package:game_app/utils/constants.dart';
import 'package:game_app/utils/util_functions.dart';
import 'package:provider/provider.dart';

class GameThree extends StatefulWidget {
  const GameThree({Key? key}) : super(key: key);

  @override
  State<GameThree> createState() => _GameThreeState();
}

class _GameThreeState extends State<GameThree> {
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
                    Consumer<GameThreeProvider>(
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
                                Constants.gameAssets('dog.png'),
                                width: 120,
                              ),
                            ),

                            //Main Boxes
                            CustomLableBox(
                              color: (value.dPress == true) ? gameBtn : kwhite,
                              top: 30,
                              left: 250,
                              letter: "d",
                            ),
                            CustomLableBox(
                              color: (value.oPress == true) ? gameBtn : kwhite,
                              top: 30,
                              left: 300,
                              letter: "o",
                            ),
                            CustomLableBox(
                              color: (value.gPress == true) ? gameBtn : kwhite,
                              top: 30,
                              left: 350,
                              letter: "g",
                            ),

                            //Letter Boxes
                            (value.dPress == true)
                                ? Text(" ")
                                : CustomLableBox(
                                    color: gameBtn,
                                    top: 180,
                                    left: 250,
                                    letter: "d",
                                    ontap: () {
                                      value.changeD();
                                    },
                                  ),
                            (value.oPress == true)
                                ? Text(" ")
                                : CustomLableBox(
                                    color: gameBtn,
                                    top: 30,
                                    left: 600,
                                    letter: "o",
                                    ontap: () {
                                      value.changeO();
                                    },
                                  ),
                            (value.gPress == true)
                                ? Text(" ")
                                : CustomLableBox(
                                    color: gameBtn,
                                    top: 130,
                                    left: 450,
                                    letter: "g",
                                    ontap: () {
                                      value.changeG();
                                      if (isPlaying == false) {
                                        controller.play();
                                      }
                                    },
                                  ),

                            CustomGameNavigationRow(
                              onNextPress: () {},
                              onBackPress: () {
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}
