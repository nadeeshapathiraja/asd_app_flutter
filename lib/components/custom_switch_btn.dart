import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:game_app/components/custom_text.dart';
import 'package:game_app/providers/mode_change_provider.dart';
import 'package:game_app/utils/app_colors.dart';
import 'package:game_app/utils/util_functions.dart';
import 'package:game_app/views/home_screen/home_screen.dart';
import 'package:provider/provider.dart';

class CustomSwitchBtn extends StatefulWidget {
  const CustomSwitchBtn({Key? key}) : super(key: key);

  @override
  State<CustomSwitchBtn> createState() => _CustomSwitchBtnState();
}

class _CustomSwitchBtnState extends State<CustomSwitchBtn> {
  bool mode = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<ModeProvider>(
      builder: (context, value, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomText(text: "PARENT MODE"),
            SizedBox(width: 10),
            FlutterSwitch(
              width: 50.0,
              height: 25.0,
              toggleSize: 18.0,
              value: value.getMode,
              borderRadius: 30.0,
              padding: 5.0,
              activeColor: activeColor,
              onToggle: (val) {
                // value.changeMode(val);
                setState(() {
                  mode = val;
                  value.changeMode(val);
                });
                UtilFunction.navigateTo(context, HomeScreen());
              },
            ),
          ],
        );
      },
    );
  }
}
