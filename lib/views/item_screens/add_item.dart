import 'package:flutter/material.dart';
import 'package:game_app/components/custom_button.dart';
import 'package:game_app/components/custom_input.dart';
import 'package:game_app/components/custom_item_capcher.dart';
import 'package:game_app/components/custom_main_navbar.dart';
import 'package:game_app/components/custom_text.dart';
import 'package:game_app/providers/item_provider.dart';
import 'package:game_app/utils/app_colors.dart';
import 'package:game_app/utils/constants.dart';
import 'package:provider/provider.dart';

class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
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
                child: Consumer<ItemProvider>(
                  builder: (context, value, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //main Navbar
                        CustomMainNavBar(),
                        const SizedBox(height: 30),
                        const CustomText(
                          text: "Add New Item",
                          fontsize: 40,
                          color: darkColor,
                        ),
                        const SizedBox(height: 50),
                        CustomInput(
                          controller: value.getName,
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
                                      CustomItemCapcher(context: context),
                                );
                              },
                              child: Stack(
                                children: [
                                  value.getItemImg.path != ''
                                      ? Image.file(
                                          value.getItemImg,
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
                        const SizedBox(height: 30),

                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20.0),
                            ),
                          ),
                          onPressed: () async {
                            value.takeAudio();
                          },
                          icon: Icon(
                            Icons.mic,
                            size: 30,
                            color: primaryColor,
                          ),
                          label: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: CustomText(
                                text: "How is it pronounced?",
                                color: kwhite,
                                fontsize: 15,
                              )),
                        ),

                        const SizedBox(height: 50),
                        CustomButton(
                          size: size,
                          isLoading: value.isLoading,
                          onTap: () {
                            value.ItemState(context);
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
