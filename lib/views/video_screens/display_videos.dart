import 'package:flutter/material.dart';
import 'package:game_app/components/custom_backbutton.dart';
import 'package:game_app/components/custom_switch_btn.dart';
import 'package:game_app/providers/video_screen_provider.dart';
import 'package:game_app/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class DisplayVideos extends StatefulWidget {
  const DisplayVideos({Key? key}) : super(key: key);

  @override
  _DisplayVideosState createState() => _DisplayVideosState();
}

class _DisplayVideosState extends State<DisplayVideos> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

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
                // Consumer<VideoScreenProvider>(
                //   builder: (context, value, child) {
                //     return Expanded(
                //       child: Container(
                //         child: ListView.builder(
                //             itemCount: value.getVideoList.length,
                //             itemBuilder: (BuildContext context, int index) {
                //               return Text(
                //                   value.getVideoList[index]['videoUrl']);
                //             }),
                //       ),
                //     );
                //   },
                // ),

                //Video Player
                Center(
                  child: _controller.value.isInitialized
                      ? AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        )
                      : Container(),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
