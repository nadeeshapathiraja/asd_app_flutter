import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:game_app/components/custom_dialogbox.dart';
import 'package:game_app/components/custom_outline_button.dart';
import 'package:game_app/components/custom_switch_btn.dart';
import 'package:game_app/components/custom_text.dart';
import 'package:game_app/utils/app_colors.dart';
import 'package:game_app/utils/constants.dart';
import 'package:game_app/utils/util_functions.dart';
import 'package:game_app/views/category_screens/add_category.dart';
import 'package:game_app/views/category_screens/edit_category.dart';
import 'package:game_app/views/category_screens/widgets/category_tile.dart';
import 'package:game_app/views/home_screen/home_screen.dart';

class CatergoryList extends StatefulWidget {
  const CatergoryList({Key? key}) : super(key: key);

  @override
  _CatergoryListState createState() => _CatergoryListState();
}

class _CatergoryListState extends State<CatergoryList> {
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
                left: 20.0,
                right: 20.0,
                top: 10.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          UtilFunction.goBack(context);
                        },
                        child: Image.asset(
                          Constants.iconAssets("back.png"),
                          width: 35,
                          height: 35,
                        ),
                      ),
                      CustomSwitchBtn(),
                    ],
                  ),
                  SizedBox(height: 50),
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
                  CategoryTile(
                    text: "Fruits",
                    onDeleteTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return CustomDialogbox(
                            size: size,
                            text: "Are you sure to delete the category?",
                            onTap: () {},
                          );
                        },
                      );
                    },
                    onEditTap: () {
                      UtilFunction.navigateTo(context, EditCategory());
                    },
                  ),
                  SizedBox(height: 10),
                  CategoryTile(
                    text: "Desserts",
                    onDeleteTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return CustomDialogbox(
                            size: size,
                            text: "Are you sure to delete the category?",
                            onTap: () {},
                          );
                        },
                      );
                    },
                    onEditTap: () {
                      UtilFunction.navigateTo(context, EditCategory());
                    },
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
