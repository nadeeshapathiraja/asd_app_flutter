import 'package:flutter/material.dart';
import 'package:game_app/components/custom_input.dart';
import 'package:game_app/utils/app_colors.dart';
import 'package:game_app/utils/constants.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  late TextEditingController _userName = TextEditingController();
  late TextEditingController _passwor = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Constants.imageAssets("bg.jpg")),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomInput(
                  controller: _userName,
                  lableText: "User Name",
                ),
                SizedBox(height: 20),
                CustomInput(
                  controller: _passwor,
                  lableText: "Passord",
                ),
                SizedBox(height: 50),
                Container(
                  width: size.width * 0.4,
                  height: 40,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                      child: Text(
                    "Login",
                    style: TextStyle(
                      color: kwhite,
                    ),
                  )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
