import 'package:flutter/material.dart';
import 'package:game_app/components/custom_backbutton.dart';
import 'package:game_app/components/custom_switch_btn.dart';
import 'package:game_app/utils/constants.dart';
import 'package:video_player/video_player.dart';

class DisplayVideos extends StatefulWidget {
  const DisplayVideos({Key? key}) : super(key: key);

  @override
  _DisplayVideosState createState() => _DisplayVideosState();
}

class _DisplayVideosState extends State<DisplayVideos> {
  late VideoPlayerController _controller;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Constants.imageAssets("bg.jpg")),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              right: 10.0,
              top: 10.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomSwitchBtn(),
                const SizedBox(height: 10),
                Row(
                  children: [
                    //Custom Back button
                    CustomBackButton(),
                    SizedBox(
                      width: size.width * 0.25,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
