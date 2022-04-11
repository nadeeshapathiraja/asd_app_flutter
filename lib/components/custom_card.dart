import 'package:flutter/material.dart';
import 'package:game_app/components/custom_text.dart';
import 'package:game_app/utils/app_colors.dart';

class CustomCard extends StatefulWidget {
  CustomCard({
    Key? key,
    required this.size,
    this.onTap,
    required this.assetName,
    required this.title,
  }) : super(key: key);

  final Size size;
  final Function()? onTap;
  final String title;
  final String assetName;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: InkWell(
        splashColor: Colors.green[200],
        onTap: widget.onTap,
        child: Column(
          children: [
            Container(
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: activeColor,
              ),
              child: Center(
                child: CustomText(
                  text: widget.title,
                  fontsize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            SizedBox(
              width: widget.size.width * 0.4,
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.network(widget.assetName),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
