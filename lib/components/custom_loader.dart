import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:game_app/utils/app_colors.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({
    Key? key,
    this.color = kwhite,
  }) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SpinKitFadingFour(
      color: color,
      size: 40.0,
    );
  }
}
