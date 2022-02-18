import 'package:flutter/material.dart';
import 'package:game_app/components/custom_text.dart';
import 'package:game_app/utils/app_colors.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    Key? key,
    required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 440,
      width: double.infinity,
      color: kwhite,
      child: SingleChildScrollView(
        child: Column(
          children: [
            TileSection(),
            TileSection(),
            TileSection(),
            TileSection(),
          ],
        ),
      ),
    );
  }
}

class TileSection extends StatelessWidget {
  const TileSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Container(
            height: 100,
            child: Row(
              children: [
                Icon(
                  Icons.travel_explore,
                  color: primaryColor,
                  size: 30,
                ),
                SizedBox(width: 30),
                CustomText(
                  text: "Browse Web",
                  color: darkColor,
                  fontsize: 25,
                )
              ],
            ),
          ),
        ),
        const Divider(
          height: 10,
          thickness: 1,
          endIndent: 0,
          color: primaryColor,
        ),
      ],
    );
  }
}
