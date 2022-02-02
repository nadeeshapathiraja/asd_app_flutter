import 'package:flutter/material.dart';
import 'package:game_app/components/custom_text.dart';
import 'package:game_app/utils/app_colors.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({
    Key? key,
    required this.size,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  final Size size;
  final Function() onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 120,
        width: size.width,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: kwhite,
          elevation: 8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: title,
                fontsize: 30,
                fontWeight: FontWeight.w900,
                color: darkColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
