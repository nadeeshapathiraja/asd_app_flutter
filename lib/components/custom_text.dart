import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.text,
    this.fontsize = 15.0,
    this.color = Colors.black,
    this.fontWeight,
    this.alignment,
    this.textAlign,
    this.textOverflow = TextOverflow.ellipsis,
  }) : super(key: key);
  final String text;
  final double? fontsize;
  final Color color;
  final TextOverflow textOverflow;
  final FontWeight? fontWeight;
  final Alignment? alignment;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: textOverflow,
      style: TextStyle(
        fontSize: fontsize,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
