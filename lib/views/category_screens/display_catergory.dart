import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:game_app/components/custom_card.dart';
import 'package:game_app/components/custom_loader.dart';
import 'package:game_app/components/custom_switch_btn.dart';
import 'package:game_app/components/custom_text.dart';
import 'package:game_app/controllers/category_controller.dart';
import 'package:game_app/models/objects.dart';
import 'package:game_app/providers/item_provider.dart';
import 'package:game_app/providers/user_provider.dart';
import 'package:game_app/utils/app_colors.dart';
import 'package:game_app/utils/constants.dart';
import 'package:game_app/utils/util_functions.dart';
import 'package:game_app/views/item_screens/display_items.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class DisplayCatergory extends StatefulWidget {
  const DisplayCatergory({Key? key}) : super(key: key);

  @override
  _DisplayCatergoryState createState() => _DisplayCatergoryState();
}

class _DisplayCatergoryState extends State<DisplayCatergory> {
  List<CategoryModel> list = [];
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
                      height: size.height,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: kwhite,
                      ),
                      child: StreamBuilder<QuerySnapshot>(
                        stream: instances().testStream(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return const CustomText(text: "No Category");
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CustomLoader();
                          }
                          Logger().w(snapshot.data!.docs.length);

                          //List always clear before load
                          list.clear();

                          //Add category by category to list
                          for (var item in snapshot.data!.docs) {
                            Map<String, dynamic> data =
                                item.data() as Map<String, dynamic>;

                            var model = CategoryModel.fromJson(data);

                            if (model.uid ==
                                    Provider.of<UserProvider>(context,
                                            listen: false)
                                        .userModel
                                        .uid ||
                                model.uid == "nCXJ1SAfMUNuFCmspZLKRCIhNFm2") {
                              list.add(model);
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
                                        onTap: () {
                                          Provider.of<ItemProvider>(context,
                                                  listen: false)
                                              .changeCategory(
                                            list[index].id,
                                            list[index].name,
                                          );
                                          UtilFunction.navigateTo(
                                            context,
                                            DisplayItemsScreen(),
                                          );
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
}
