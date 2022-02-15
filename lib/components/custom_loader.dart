import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:game_app/utils/app_colors.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitFadingFour(
      color: kwhite,
      size: 40.0,
    );
  }
}
