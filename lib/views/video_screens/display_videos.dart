import 'package:flutter/material.dart';
import 'package:game_app/components/custom_backbutton.dart';
import 'package:game_app/components/custom_switch_btn.dart';
import 'package:game_app/providers/video_screen_provider.dart';
import 'package:game_app/utils/constants.dart';
import 'package:provider/provider.dart';

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
                Consumer<VideoScreenProvider>(
                  builder: (context, value, child) {
                    return Expanded(
                      child: Container(
                        child: ListView.builder(
                            itemCount: value.getVideoList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Text(
                                  value.getVideoList[index]['videoUrl']);
                            }),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
