import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:game_app/providers/user_provider.dart';
import 'package:game_app/utils/constants.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 2),
      () {
        Provider.of<UserProvider>(context, listen: false)
            .initializedUser(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Pulse(
              duration: Duration(seconds: 1),
              child: Image.asset(
                Constants.imageAssets("logo.png"),
              ),
            ),
            SizedBox(height: 30),
            Text(
              "ASD Project",
              style: TextStyle(
                fontSize: 40,
                color: Color(0xff838383),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
