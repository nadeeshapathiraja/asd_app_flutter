import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:game_app/components/custom_dialogbox.dart';
import 'package:game_app/components/custom_main_navbar.dart';
import 'package:game_app/components/custom_outline_button.dart';
import 'package:game_app/components/custom_text.dart';
import 'package:game_app/controllers/category_controller.dart';
import 'package:game_app/models/objects.dart';
import 'package:game_app/providers/category_provider.dart';
import 'package:game_app/providers/item_provider.dart';
import 'package:game_app/providers/user_provider.dart';
import 'package:game_app/utils/constants.dart';
import 'package:game_app/utils/util_functions.dart';
import 'package:game_app/views/category_screens/add_category.dart';
import 'package:game_app/views/category_screens/edit_category.dart';
import 'package:game_app/views/category_screens/widgets/category_tile.dart';
import 'package:game_app/views/item_screens/item_list.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class CatergoryList extends StatefulWidget {
  const CatergoryList({Key? key}) : super(key: key);

  @override
  _CatergoryListState createState() => _CatergoryListState();
}

class _CatergoryListState extends State<CatergoryList> {
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
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  top: 10.0,
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //main Navbar
                      CustomMainNavBar(),
                      SizedBox(height: 50),

                      //Add new category
                      CustomOutlineButton(
                        size: size,
                        text: 'Add New Category',
                        height: 60,
                        width: size.width,
                        onTap: () {
                          UtilFunction.navigateTo(context, AddCategory());
                        },
                      ),
                      SizedBox(height: 30),

                      //Category list
                      StreamBuilder<QuerySnapshot>(
                        stream: CategoryController().testStream(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return const CustomText(text: "No Category");
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          }
                          Logger().w(snapshot.data!.docs.length);
                          // Logger().d(value.userModel.uid);

                          //List always clear before load
                          list.clear();

                          //Add category by category to list
                          for (var item in snapshot.data!.docs) {
                            Map<String, dynamic> data =
                                item.data() as Map<String, dynamic>;

                            var model = CategoryModel.fromJson(data);

                            String userid = Provider.of<UserProvider>(context,
                                    listen: false)
                                .userModel
                                .uid;

                            if (model.uid == userid) {
                              list.add(model);
                            }
                          }

                          return Expanded(
                            child: ListView.separated(
                              itemBuilder: (context, index) {
                                return CategoryTile(
                                  text: list[index].name,
                                  ontap: () {
                                    Provider.of<ItemProvider>(context,
                                            listen: false)
                                        .changeCategory(
                                      list[index].id,
                                      list[index].name,
                                    );
                                    UtilFunction.navigateTo(
                                      context,
                                      ItemList(),
                                    );
                                  },
                                  onDeleteTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return CustomDialogbox(
                                          size: size,
                                          text:
                                              "Are you sure to delete the category?",
                                          onTap: () async {
                                            await CategoryController()
                                                .deleteCategory(list[index].id);
                                            UtilFunction.pushRemoveRoute(
                                                context, CatergoryList());
                                          },
                                        );
                                      },
                                    );
                                  },
                                  onEditTap: () {
                                    Provider.of<CategoryProvider>(context,
                                            listen: false)
                                        .changeId(list[index].id);
                                    UtilFunction.navigateTo(
                                      context,
                                      EditCategory(
                                        id: list[index].id,
                                        name: list[index].name,
                                        url: list[index].img,
                                      ),
                                    );
                                  },
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  SizedBox(height: 30),
                              itemCount: list.length,
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
