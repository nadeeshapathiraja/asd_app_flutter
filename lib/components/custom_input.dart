import 'package:flutter/material.dart';
import 'package:game_app/utils/app_colors.dart';

// ignore: must_be_immutable
class CustomInput extends StatelessWidget {
  CustomInput({
    Key? key,
    required this.controller,
    required this.lableText,
    this.iconBtn,
    this.isObsecure = false,
    this.inputType = TextInputType.text,
  }) : super(key: key);

  TextEditingController controller = TextEditingController();
  final String lableText;
  final IconButton? iconBtn;
  final bool isObsecure;
  final TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObsecure,
      keyboardType: inputType,
      decoration: InputDecoration(
        labelText: lableText,
        labelStyle: const TextStyle(
          color: darkColor,
          fontSize: 18,
        ),
        suffixIcon: iconBtn,
      ),
    );
  }
}
