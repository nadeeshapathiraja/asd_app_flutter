import 'package:flutter/material.dart';
import 'package:game_app/components/custom_button.dart';
import 'package:game_app/components/custom_game_card.dart';
import 'package:game_app/components/custom_switch_btn.dart';
import 'package:game_app/components/custom_text.dart';
import 'package:game_app/providers/mode_change_provider.dart';
import 'package:game_app/providers/user_provider.dart';
import 'package:game_app/utils/app_colors.dart';
import 'package:game_app/utils/constants.dart';
import 'package:game_app/utils/util_functions.dart';
import 'package:game_app/views/game_screens/game_one/game_one.dart';
import 'package:game_app/views/game_screens/game_two/game_two.dart';
import 'package:game_app/views/report_screen/report_screen.dart';
import 'package:provider/provider.dart';

class GameCatergoryScreen extends StatefulWidget {
  const GameCatergoryScreen({Key? key}) : super(key: key);

  @override
  State<GameCatergoryScreen> createState() => _GameCatergoryScreenState();
}

class _GameCatergoryScreenState extends State<GameCatergoryScreen> {
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomSwitchBtn(),
                  const SizedBox(height: 10),
                  CustomText(
                    text: "Categories",
                    fontWeight: FontWeight.w700,
                    fontsize: 40,
                    color: darkColor,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        width: size.width,
                        // height: size.height * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: kwhite,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Provider.of<ModeProvider>(context, listen: false)
                                    .getMode
                                ? Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: CustomButton(
                                        size: size,
                                        onTap: () {
                                          UtilFunction.navigateTo(
                                            context,
                                            ReportScreen(),
                                          );
                                        },
                                        textValue: "Reports"),
                                  )
                                : CustomText(text: ""),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    //Custom Card for display catergories
                                    CustomGameCard(
                                      size: size,
                                      assetName: "animals.png",
                                      title: "Animal",
                                      onTap: () {
                                        UtilFunction.navigateTo(
                                            context, GameOne());
                                      },
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    CustomGameCard(
                                      size: size,
                                      assetName: "vehicle.png",
                                      title: "Vehicle",
                                      onTap: () {
                                        UtilFunction.navigateTo(
                                            context, GameTwo());
                                      },
                                    ),
                                    SizedBox(
                                      height: 200,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    //Custom Card for display catergories
                                    CustomGameCard(
                                      size: size,
                                      assetName: "vegi.png",
                                      title: "Vegetable",
                                      onTap: () {},
                                    ),

                                    SizedBox(
                                      height: 200,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    ));
  }
}
