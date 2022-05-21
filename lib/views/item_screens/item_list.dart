import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:game_app/components/custom_loader.dart';
import 'package:game_app/components/custom_main_navbar.dart';
import 'package:game_app/components/custom_outline_button.dart';
import 'package:game_app/components/custom_text.dart';
import 'package:game_app/controllers/item_controller.dart';
import 'package:game_app/models/objects.dart';
import 'package:game_app/providers/item_provider.dart';
import 'package:game_app/providers/user_provider.dart';
import 'package:game_app/utils/app_colors.dart';
import 'package:game_app/utils/constants.dart';
import 'package:game_app/utils/util_functions.dart';
import 'package:game_app/views/item_screens/add_item.dart';
import 'package:game_app/views/item_screens/edit_items.dart';
import 'package:game_app/views/item_screens/widgets/item_tile.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class ItemList extends StatefulWidget {
  const ItemList({Key? key}) : super(key: key);

  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  List<ItemModel> list = [];
  AudioPlayer audioPlayer = AudioPlayer();
  bool playing = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    AudioPlayer audioPlayer = AudioPlayer(mode: PlayerMode.LOW_LATENCY);
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Constants.imageAssets("bg.jpg")),
              fit: BoxFit.cover,
            ),
          ),
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                top: 10.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //main Navbar
                  CustomMainNavBar(),
                  const SizedBox(height: 30),
                  CustomText(
                    text: Provider.of<ItemProvider>(context, listen: false)
                        .selectedCategoryName,
                    fontsize: 40,
                    color: darkColor,
                  ),
                  const SizedBox(height: 30),
                  CustomOutlineButton(
                    size: size,
                    text: 'Add',
                    height: 60,
                    width: size.width,
                    onTap: () {
                      UtilFunction.navigateTo(context, AddItem());
                    },
                  ),
                  const SizedBox(height: 30),
                  Expanded(
                    child: Container(
                      child: StreamBuilder<QuerySnapshot>(
                        stream: ItemController().getItems(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return const CustomText(text: "No Items");
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CustomLoader(
                              color: kGrey,
                            );
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
                                    .uid) {
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
                                      ItemTile(
                                        size: size,
                                        text: list[index].name,
                                        imgName: list[index].img,
                                        onEditTap: () {
                                          String CategoryId =
                                              Provider.of<ItemProvider>(context,
                                                      listen: false)
                                                  .selectedId;
                                          Provider.of<ItemProvider>(context,
                                                  listen: false)
                                              .changeItem(
                                            CategoryId,
                                            list[index].id,
                                            list[index].name,
                                            list[index].img,
                                          );
                                          UtilFunction.navigateTo(
                                              context, EditItem());
                                        },
                                        onVoiceTap: () {
                                          getAudio(list[index].audio);
                                        },
                                      ),
                                    ],
                                  ),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 0,
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
