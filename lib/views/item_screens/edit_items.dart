import 'package:flutter/material.dart';
import 'package:game_app/components/custom_bottom_sheet.dart';
import 'package:game_app/components/custom_button.dart';
import 'package:game_app/components/custom_dialogbox.dart';
import 'package:game_app/components/custom_input.dart';
import 'package:game_app/components/custom_main_navbar.dart';
import 'package:game_app/components/custom_text.dart';
import 'package:game_app/providers/category_provider.dart';
import 'package:game_app/utils/app_colors.dart';
import 'package:game_app/utils/constants.dart';
import 'package:game_app/utils/util_functions.dart';
import 'package:game_app/views/item_screens/item_list.dart';
import 'package:provider/provider.dart';

class EditItem extends StatefulWidget {
  const EditItem({Key? key}) : super(key: key);

  @override
  _EditItemState createState() => _EditItemState();
}

class _EditItemState extends State<EditItem> {
  final TextEditingController _email = TextEditingController();
  bool status = true;
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
            child: SingleChildScrollView(
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
                    const CustomText(
                      text: "Edit Item     ",
                      fontsize: 40,
                      color: darkColor,
                    ),
                    const SizedBox(height: 50),
                    CustomInput(
                      controller: _email,
                      lableText: "Item Name",
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (builder) =>
                                  CustomBottomSheet(context: context),
                            );
                          },
                          child: Stack(
                            children: [
                              Consumer<CategoryProvider>(
                                builder: (context, value, child) {
                                  return Image.asset(
                                    Constants.imageAssets("logo.png"),
                                    width: 150,
                                    height: 150,
                                  );
                                },
                                // value.imageFile == null ?
                                // FileImage(File(value.imageFile.path)
                              ),
                              Positioned(
                                bottom: 20,
                                right: 20,
                                child: Icon(
                                  Icons.camera_alt,
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    CustomInput(
                      controller: _email,
                      lableText: "How is it pronounced?",
                      iconBtn: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.mic,
                          size: 30,
                          color: primaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    CustomButton(
                      size: size,
                      onTap: () {
                        UtilFunction.navigateTo(context, ItemList());
                      },
                      textValue: "Done",
                    ),
                    SizedBox(height: 50),
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return CustomDialogbox(
                              size: size,
                              text: "Are you sure to delete the Item?",
                              onTap: () {
                                UtilFunction.pushRemoveRoute(
                                    context, ItemList());
                              },
                            );
                          },
                        );
                      },
                      child: CustomText(
                        text: "[Delete item]",
                        color: darkColor,
                        fontsize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
