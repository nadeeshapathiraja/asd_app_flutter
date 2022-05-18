import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:game_app/components/custom_backbutton.dart';
import 'package:game_app/components/custom_card.dart';
import 'package:game_app/components/custom_loader.dart';
import 'package:game_app/components/custom_switch_btn.dart';
import 'package:game_app/components/custom_text.dart';
import 'package:game_app/controllers/item_controller.dart';
import 'package:game_app/models/objects.dart';
import 'package:game_app/providers/item_provider.dart';
import 'package:game_app/providers/user_provider.dart';
import 'package:game_app/utils/app_colors.dart';
import 'package:game_app/utils/constants.dart';
import 'package:provider/provider.dart';

class DisplayItemsScreen extends StatefulWidget {
  DisplayItemsScreen({
    Key? key,
  }) : super(key: key);

  @override
  _DisplayItemsScreenState createState() => _DisplayItemsScreenState();
}

class _DisplayItemsScreenState extends State<DisplayItemsScreen> {
  List<ItemModel> list = [];
  AudioPlayer audioPlayer = AudioPlayer();
  bool playing = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    AudioPlayer audioPlayer = AudioPlayer(mode: PlayerMode.LOW_LATENCY);
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
                      CustomText(
                        text: Provider.of<ItemProvider>(context, listen: false)
                            .selectedCategoryName,
                        fontWeight: FontWeight.w700,
                        fontsize: 40,
                        color: darkColor,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Container(
                      width: size.width,
                      height: size.height,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: kwhite,
                      ),
                      child: StreamBuilder<QuerySnapshot>(
                        stream: ItemController().getItems(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return const CustomText(text: "No Items");
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CustomLoader();
                          }

                          //List always clear before load
                          list.clear();

                          //Add category by category to list
                          for (var item in snapshot.data!.docs) {
                            Map<String, dynamic> data =
                                item.data() as Map<String, dynamic>;

                            var model = ItemModel.fromJson(data);

                            if (model.uid ==
                                    Provider.of<UserProvider>(context,
                                            listen: false)
                                        .userModel
                                        .uid ||
                                model.uid == "nCXJ1SAfMUNuFCmspZLKRCIhNFm2") {
                              if (model.categoryId ==
                                  Provider.of<ItemProvider>(context,
                                          listen: false)
                                      .selectedId) {
                                list.add(model);
                              }
                            }
                          }

                          return Column(
                            children: [
                              Expanded(
                                child: GridView.builder(
                                  itemCount: list.length,
                                  itemBuilder: (context, index) => Column(
                                    children: [
                                      CustomCard(
                                        size: size,
                                        assetName: list[index].img,
                                        title: list[index].name,
                                        onTap: () async {
                                          getAudio(list[index].audio);
                                        },
                                      ),
                                    ],
                                  ),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    mainAxisSpacing: 0,
                                    crossAxisSpacing: 0,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> getAudio(String url) async {
    if (playing) {
      //pause song
      var res = await audioPlayer.pause();
      if (res == 1) {
        setState(() {
          playing = false;
        });
      }
    } else {
      //play song
      var res = await audioPlayer.play(url, isLocal: true);
      if (res == 1) {
        setState(() {
          playing = true;
        });
      }
    }
  }
}
