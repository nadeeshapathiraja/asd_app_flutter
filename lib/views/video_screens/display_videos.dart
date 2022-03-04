// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:game_app/components/custom_backbutton.dart';
import 'package:game_app/components/custom_input.dart';
import 'package:game_app/components/custom_switch_btn.dart';
import 'package:game_app/providers/video_screen_provider.dart';
import 'package:game_app/utils/app_colors.dart';
import 'package:game_app/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DisplayVideos extends StatefulWidget {
  const DisplayVideos({Key? key}) : super(key: key);

  @override
  _DisplayVideosState createState() => _DisplayVideosState();
}

class _DisplayVideosState extends State<DisplayVideos> {
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
                Expanded(
                  child: Container(
                    child: Consumer<VideoScreenProvider>(
                      builder: (context, value, child) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              CustomInput(
                                controller: value.getUrl,
                                lableText: 'Input Url',
                                hintText: "Youtube URL",
                                iconBtn: IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    if (value.getUrl.text != null) {
                                      value.addItemFunction();
                                    }
                                  },
                                  iconSize: 30,
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                child: Expanded(
                                  child: ListView.builder(
                                    itemCount: value.getVideoId.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin: EdgeInsets.all(8.0),
                                        child: YoutubePlayer(
                                          controller: YoutubePlayerController(
                                            initialVideoId:
                                                value.getVideoId[index],
                                            flags: YoutubePlayerFlags(
                                              autoPlay: false,
                                            ),
                                          ),
                                          showVideoProgressIndicator: true,
                                          progressIndicatorColor: kBlue,
                                          progressColors: ProgressBarColors(
                                            playedColor: kBlue,
                                            handleColor: kGrey,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
