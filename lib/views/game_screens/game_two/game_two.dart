import 'package:flutter/material.dart';
import 'package:game_app/components/custom_backbutton.dart';
import 'package:game_app/components/custom_game_navigation_row.dart';
import 'package:game_app/components/custom_lable_box.dart';
import 'package:game_app/components/custom_switch_btn.dart';
import 'package:game_app/components/custom_text.dart';
import 'package:game_app/providers/game/game_one_provider.dart';
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
                              bottom: 20,
                              left: 20,
                              child: Image.asset(
                                Constants.gameAssets('train.png'),
                                width: 250,
                              ),
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
                            CustomLableBox(
                              color: gameBtn,
                              top: 180,
                              left: 400,
                              letter: "b",
                              ontap: () {
                                value.changeB();
                                print("b press");
                              },
                            ),
                            CustomLableBox(
                              color: gameBtn,
                              top: 150,
                              left: 300,
                              letter: "i",
                              ontap: () {
                                value.changeI();
                              },
                            ),
                            CustomLableBox(
                              color: gameBtn,
                              top: 70,
                              left: 500,
                              letter: "r",
                              ontap: () {
                                value.changeR();
                              },
                            ),
                            CustomLableBox(
                              color: gameBtn,
                              top: 150,
                              left: 500,
                              letter: "d",
                              ontap: () {
                                value.changeD();
                              },
                            ),

                            CustomGameNavigationRow(
                              onNextPress: () {},
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              )),
        ),
      ),
    ));
  }
}
