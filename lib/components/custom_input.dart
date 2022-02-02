import 'package:flutter/material.dart';
import 'package:game_app/utils/app_colors.dart';

// ignore: must_be_immutable
class CustomInput extends StatelessWidget {
  CustomInput({
    Key? key,
    required this.controller,
    required this.lableText,
  }) : super(key: key);

  TextEditingController controller = TextEditingController();
  final String lableText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: lableText,
        labelStyle: const TextStyle(
          color: darkColor,
          fontSize: 18,
        ),
      ),
    );
  }
}
