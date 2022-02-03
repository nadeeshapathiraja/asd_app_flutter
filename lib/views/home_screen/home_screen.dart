import 'package:flutter/material.dart';
import 'package:game_app/components/custom_text.dart';
import 'package:game_app/utils/app_colors.dart';
import 'package:game_app/utils/constants.dart';
import 'package:game_app/utils/util_functions.dart';
import 'package:game_app/views/category_screens/display_catergory.dart';
import 'package:game_app/views/home_screen/widgets/activity_card.dart';
import 'package:flutter_switch/flutter_switch.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool status = false;
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
                left: 40.0,
                right: 40.0,
                top: 10.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomText(text: "PARENT MODE"),
                      SizedBox(width: 10),
                      FlutterSwitch(
                        width: 50.0,
                        height: 25.0,
                        toggleSize: 18.0,
                        value: status,
                        borderRadius: 30.0,
                        padding: 5.0,
                        activeColor: activeColor,
                        onToggle: (val) {
                          setState(() {
                            status = val;
                          });
                        },
                      ),
                    ],
                  ),
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
                      ActivityCard(
                        size: size,
                        onTap: () {
                          UtilFunction.navigateTo(context, DisplayCatergory());
                        },
                        title: "Vocabulary",
                      ),
                      SizedBox(height: 30),
                      ActivityCard(
                        size: size,
                        onTap: () {},
                        title: "Video Activity",
                      ),
                      SizedBox(height: 30),
                      ActivityCard(
                        size: size,
                        onTap: () {},
                        title: "Play time",
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
