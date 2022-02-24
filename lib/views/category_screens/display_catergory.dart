import 'package:flutter/material.dart';
import 'package:game_app/components/custom_card.dart';
import 'package:game_app/components/custom_switch_btn.dart';
import 'package:game_app/components/custom_text.dart';
import 'package:game_app/utils/app_colors.dart';
import 'package:game_app/utils/constants.dart';
import 'package:game_app/utils/util_functions.dart';
import 'package:game_app/views/item_screens/display_items.dart';

class DisplayCatergory extends StatefulWidget {
  const DisplayCatergory({Key? key}) : super(key: key);

  @override
  _DisplayCatergoryState createState() => _DisplayCatergoryState();
}

class _DisplayCatergoryState extends State<DisplayCatergory> {
  bool mode = false;
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
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //Custom Card for display catergories
                                CustomCard(
                                  size: size,
                                  assetName: "apple.png",
                                  title: "Fruits",
                                  onTap: () {
                                    UtilFunction.navigateTo(
                                      context,
                                      DisplayItemsScreen(),
                                    );
                                  },
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                CustomCard(
                                  size: size,
                                  assetName: "vegi.png",
                                  title: "Vegitables",
                                  onTap: () {},
                                ),
                                SizedBox(
                                  height: 200,
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
