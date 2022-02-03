import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:game_app/components/custom_card.dart';
import 'package:game_app/components/custom_text.dart';
import 'package:game_app/utils/app_colors.dart';
import 'package:game_app/utils/constants.dart';
import 'package:game_app/utils/util_functions.dart';
import 'package:game_app/views/home_screen/home_screen.dart';

class DisplayCatergory extends StatefulWidget {
  const DisplayCatergory({Key? key}) : super(key: key);

  @override
  _DisplayCatergoryState createState() => _DisplayCatergoryState();
}

class _DisplayCatergoryState extends State<DisplayCatergory> {
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
                left: 10.0,
                right: 10.0,
                top: 10.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const CustomText(text: "PARENT MODE"),
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
                          UtilFunction.navigateTo(context, HomeScreen());
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  CustomText(
                    text: "Categories",
                    fontWeight: FontWeight.w700,
                    fontsize: 40,
                    color: darkColor,
                  ),
                  Container(
                    width: size.width,
                    // height: size.height * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: kwhite,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomCard(size: size),
                        SizedBox(
                          height: 200,
                        )
                      ],
                    ),
                  )
                ],
              )),
        ),
      ),
    ));
  }
}
