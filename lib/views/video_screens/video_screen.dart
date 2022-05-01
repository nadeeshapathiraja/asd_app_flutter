import 'dart:io';

import 'package:flutter/material.dart';
import 'package:game_app/components/custom_backbutton.dart';
import 'package:game_app/components/custom_switch_btn.dart';
import 'package:game_app/utils/constants.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreen extends StatefulWidget {
  VideoScreen({
    Key? key,
    required this.url,
  }) : super(key: key);
  late String url;

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'TTb4Dkyt2pA',
    flags: YoutubePlayerFlags(
      isLive: false,
      mute: false,
    ),
  );

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
        child: SingleChildScrollView(
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

                  //Youtube player
                  YoutubePlayer(
                    controller: _controller,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
