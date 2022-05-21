import 'package:flutter/material.dart';
import 'package:game_app/components/custom_text.dart';
import 'package:game_app/utils/app_colors.dart';
import 'package:game_app/utils/constants.dart';

class ItemTile extends StatelessWidget {
  const ItemTile({
    Key? key,
    required this.size,
    required this.onEditTap,
    required this.onVoiceTap,
    required this.text,
    required this.imgName,
  }) : super(key: key);

  final Size size;
  final String text;
  final Function() onVoiceTap;
  final Function() onEditTap;
  final String imgName;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Column(
        children: [
          Container(
            width: size.width * 0.42,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: activeColor,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: text,
                    fontsize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: onVoiceTap,
                        child: Icon(
                          Icons.record_voice_over,
                        ),
                      ),
                      SizedBox(width: 5),
                      InkWell(
                        onTap: onEditTap,
                        child: Image.asset(
                          Constants.iconAssets("edit.png"),
                          width: 25,
                          height: 25,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: size.width * 0.42,
            height: 100,
            child: Image.network(
              imgName,
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }
}
