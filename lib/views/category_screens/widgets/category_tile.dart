import 'package:flutter/material.dart';
import 'package:game_app/components/custom_text.dart';
import 'package:game_app/utils/app_colors.dart';
import 'package:game_app/utils/constants.dart';
import 'package:game_app/utils/util_functions.dart';
import 'package:game_app/views/item_screens/item_list.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    Key? key,
    required this.onDeleteTap,
    required this.onEditTap,
    required this.text,
    required this.ontap,
  }) : super(key: key);

  final String text;
  final Function() onEditTap;
  final Function() onDeleteTap;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          color: kwhite,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: text,
                color: primaryColor,
                fontWeight: FontWeight.w800,
                fontsize: 25,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: onEditTap,
                    child: Image.asset(
                      Constants.iconAssets("edit.png"),
                      width: 30,
                      height: 30,
                    ),
                  ),
                  SizedBox(width: 10),
                  InkWell(
                    onTap: onDeleteTap,
                    child: Image.asset(
                      Constants.iconAssets("delete.png"),
                      width: 30,
                      height: 30,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
