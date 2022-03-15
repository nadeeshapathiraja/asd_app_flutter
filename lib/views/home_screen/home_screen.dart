import 'package:flutter/material.dart';
import 'package:game_app/components/custom_button.dart';
import 'package:game_app/components/custom_switch_btn.dart';
import 'package:game_app/components/custom_text.dart';
import 'package:game_app/providers/mode_change_provider.dart';
import 'package:game_app/providers/user_provider.dart';
import 'package:game_app/utils/app_colors.dart';
import 'package:game_app/utils/constants.dart';
import 'package:game_app/utils/util_functions.dart';
import 'package:game_app/views/category_screens/catergory_list.dart';
import 'package:game_app/views/category_screens/display_catergory.dart';
import 'package:game_app/views/game_screens/game_catergory_screen.dart';
import 'package:game_app/views/home_screen/widgets/activity_card.dart';
import 'package:game_app/views/video_screens/video_catergory.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
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
              left: 40.0,
              right: 40.0,
              top: 10.0,
            ),
            //Add consumer for mode change
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Parent mode changer
                CustomSwitchBtn(),
                const SizedBox(height: 20),
                const CustomText(
                  text: "Welcome",
                  fontsize: 40,
                  color: darkColor,
                ),
                const SizedBox(height: 30),
                const CustomText(
                  text: "What would you like\nto do today",
                  fontsize: 18,
                  color: darkColor,
                ),
                const SizedBox(height: 30),
                Column(
                  children: [
                    Consumer<ModeProvider>(
                      builder: (context, value, child) {
                        return Column(
                          children: [
                            ActivityCard(
                              size: size,
                              onTap: () {
                                if (value.getMode == true) {
                                  UtilFunction.navigateTo(
                                      context, CatergoryList());
                                } else {
                                  UtilFunction.navigateTo(
                                      context, DisplayCatergory());
                                }
                              },
                              title: "Vocabulary",
                            ),
                            SizedBox(height: 30),
                            ActivityCard(
                              size: size,
                              onTap: () {
                                UtilFunction.navigateTo(
                                    context, VideoCatergory());
                              },
                              title: "Video Activity",
                            ),
                            SizedBox(height: 30),
                            ActivityCard(
                              size: size,
                              onTap: () {
                                UtilFunction.navigateTo(
                                    context, GameCatergoryScreen());
                              },
                              title: "Play time",
                            ),
                            SizedBox(height: 30),
                            value.getMode
                                ? CustomButton(
                                    size: size,
                                    textValue: "SignOut",
                                    onTap: () {
                                      Provider.of<UserProvider>(context,
                                              listen: false)
                                          .logout(context);
                                    },
                                  )
                                : CustomText(text: ""),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
