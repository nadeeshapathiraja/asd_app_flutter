import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:game_app/components/custom_backbutton.dart';
import 'package:game_app/components/custom_input.dart';
import 'package:game_app/components/custom_switch_btn.dart';
import 'package:game_app/utils/app_colors.dart';
import 'package:game_app/utils/constants.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DisplayVideos extends StatefulWidget {
  const DisplayVideos({Key? key}) : super(key: key);

  @override
  _DisplayVideosState createState() => _DisplayVideosState();
}

class _DisplayVideosState extends State<DisplayVideos> {
  TextEditingController _addItem = TextEditingController();
  late YoutubePlayerController _youtubePlayerController;
  late DocumentReference linkRef;
  List<String> videoId = [];
  bool shoItem = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                    child: SingleChildScrollView(
                      child: Container(
                        width: size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          //color: kwhite,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              CustomInput(
                                controller: _addItem,
                                lableText: 'Input Url',
                                iconBtn: IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {},
                                  iconSize: 30,
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                child: ListView.builder(
                                    itemCount: videoId.length,
                                    itemBuilder: (context, index) {
                                      return Container();
                                    }),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
