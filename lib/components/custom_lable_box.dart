import 'package:flutter/material.dart';
import 'package:game_app/components/custom_text.dart';

class CustomLableBox extends StatelessWidget {
  const CustomLableBox({
    Key? key,
    this.bottom,
    this.left,
    this.right,
    this.top,
    required this.color,
    required this.letter,
    this.ontap,
  }) : super(key: key);

  final double? bottom;
  final double? left;
  final double? right;
  final double? top;
  final Color color;
  final String letter;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: bottom,
      left: left,
      right: right,
      top: top,
      child: InkWell(
        onTap: ontap,
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: color,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 5.0,
              ),
            ],
          ),
          child: Center(
            child: CustomText(
              text: letter,
              fontsize: 40,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
