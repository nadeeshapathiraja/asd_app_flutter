import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:game_app/components/custom_card.dart';
import 'package:game_app/components/custom_loader.dart';
import 'package:game_app/components/custom_switch_btn.dart';
import 'package:game_app/components/custom_text.dart';
import 'package:game_app/controllers/video_controller.dart';
import 'package:game_app/models/objects.dart';
import 'package:game_app/utils/app_colors.dart';
import 'package:game_app/utils/constants.dart';
import 'package:logger/logger.dart';

class VideoCatergory extends StatefulWidget {
  const VideoCatergory({Key? key}) : super(key: key);

  @override
  State<VideoCatergory> createState() => _VideoCatergoryState();
}

class _VideoCatergoryState extends State<VideoCatergory> {
  List<VideoModel> list = [];
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
                  CustomText(
                    text: "Categories",
                    fontWeight: FontWeight.w700,
                    fontsize: 40,
                    color: darkColor,
                  ),
                  Expanded(
                    child: Container(
                      width: size.width,
                      // height: size.height * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: kwhite,
                      ),
                      child: StreamBuilder<QuerySnapshot>(
                        stream: VideoController().getVideos(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return const CustomText(text: "No Items");
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CustomLoader();
                          }
                          Logger().w(snapshot.data!.docs.length);

                          //List always clear before load
                          list.clear();

                          //Add category by category to list
                          for (var video in snapshot.data!.docs) {
                            Map<String, dynamic> data =
                                video.data() as Map<String, dynamic>;

                            var model = VideoModel.fromJson(data);

                            list.add(model);
                          }

                          return Expanded(
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 0,
                                crossAxisSpacing: 0,
                              ),
                              itemCount: list.length,
                              itemBuilder: (context, index) => Column(
                                children: [
                                  CustomCard(
                                    size: size,
                                    assetName: list[index].thumbnail,
                                    title: list[index].name,
                                    onTap: () {
                                      Logger().i(list[index].name);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    ));
  }
}
