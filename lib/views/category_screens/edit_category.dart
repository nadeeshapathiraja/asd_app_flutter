import 'package:flutter/material.dart';
import 'package:game_app/components/custom_bottom_sheet.dart';
import 'package:game_app/components/custom_button.dart';
import 'package:game_app/components/custom_input.dart';
import 'package:game_app/components/custom_main_navbar.dart';
import 'package:game_app/components/custom_text.dart';
import 'package:game_app/providers/category_provider.dart';
import 'package:game_app/utils/app_colors.dart';
import 'package:game_app/utils/constants.dart';
import 'package:game_app/utils/util_functions.dart';
import 'package:game_app/views/category_screens/catergory_list.dart';
import 'package:provider/provider.dart';

class EditCategory extends StatefulWidget {
  const EditCategory({
    Key? key,
    required this.id,
    this.name,
    this.url,
  }) : super(key: key);
  final String id;
  final String? name;
  final String? url;

  @override
  _EditCategoryState createState() => _EditCategoryState();
}

class _EditCategoryState extends State<EditCategory> {
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
                child: Consumer<CategoryProvider>(
                  builder: (context, value, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //main Navbar
                        CustomMainNavBar(),

                        const SizedBox(height: 30),
                        const CustomText(
                          text: "Edit Category",
                          fontsize: 40,
                          color: darkColor,
                        ),
                        const SizedBox(height: 50),
                        CustomInput(
                          controller: value.categoryName,
                          lableText: "Category Name",
                          hintText: widget.id,
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
                                  value.getImg.path != ''
                                      ? Image.file(
                                          value.getImg,
                                          fit: BoxFit.fill,
                                          width: size.width * 0.4,
                                        )
                                      : Image.asset(
                                          Constants.imageAssets("logo.png"),
                                          width: 150,
                                          height: 150,
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

                        const SizedBox(height: 50),
                        CustomButton(
                          size: size,
                          onTap: () {
                            UtilFunction.navigateTo(context, CatergoryList());
                          },
                          textValue: "Done",
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
