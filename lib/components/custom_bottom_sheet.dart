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
            TileSection(
              title: "Browse Web",
              icon: Icons.travel_explore,
              onTap: () {},
            ),
            TileSection(
              title: "Capture Photo",
              icon: Icons.camera_alt,
              onTap: () {},
            ),
            TileSection(
              title: "Attach Photo",
              icon: Icons.photo_library,
              onTap: () {},
            ),
            TileSection(
              title: "Close",
              icon: Icons.clear,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class TileSection extends StatelessWidget {
  const TileSection({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final IconData icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: InkWell(
            onTap: onTap,
            child: Container(
              height: 100,
              child: Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: kGrey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      Positioned(
                        bottom: 2,
                        left: 2,
                        right: 2,
                        top: 2,
                        child: Icon(
                          icon,
                          color: darkColor,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 30),
                  CustomText(
                    text: title,
                    color: darkColor,
                    fontsize: 25,
                  )
                ],
              ),
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
