import 'package:flutter/material.dart';
import 'package:game_app/providers/user_provider.dart';
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
    Future.delayed(Duration(seconds: 1), () {
      Provider.of<UserProvider>(context, listen: false)
          .initializedUser(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.gamepad,
              size: 100,
            ),
            SizedBox(height: 8),
            Text(
              "Game App",
              style: TextStyle(
                fontSize: 36,
                color: Color(0xff838383),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
