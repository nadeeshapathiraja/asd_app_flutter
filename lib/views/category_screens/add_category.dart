import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:game_app/components/custom_bottom_sheet.dart';
import 'package:game_app/components/custom_button.dart';
import 'package:game_app/components/custom_input.dart';
import 'package:game_app/components/custom_text.dart';
import 'package:game_app/utils/app_colors.dart';
import 'package:game_app/utils/constants.dart';
import 'package:game_app/utils/util_functions.dart';
import 'package:game_app/views/category_screens/catergory_list.dart';
import 'package:game_app/views/home_screen/home_screen.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({Key? key}) : super(key: key);

  @override
  _AddCategoryState createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
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
                        Row(
                          children: [
                            const CustomText(text: "PARENT MODE"),
                            SizedBox(width: 10),
                            FlutterSwitch(
                              width: 50.0,
                              height: 25.0,
                              toggleSize: 18.0,
                              value: status,
                              borderRadius: 30.0,
                              padding: 5.0,
                              activeColor: activeColor,
                              onToggle: (val) {
                                setState(() {
                                  status = val;
                                });
                                UtilFunction.navigateTo(context, HomeScreen());
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    const CustomText(
                      text: "Add New Category",
                      fontsize: 40,
                      color: darkColor,
                    ),
                    const SizedBox(height: 50),
                    CustomInput(
                      controller: _email,
                      lableText: "Category Name",
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
                              Image.asset(
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
                        UtilFunction.navigateTo(context, CatergoryList());
                      },
                      textValue: "Done",
                    ),
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
