import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:game_app/providers/auth/login_provider.dart';
import 'package:game_app/providers/auth/register_provider.dart';
import 'package:game_app/providers/category_provider.dart';
import 'package:game_app/providers/game/game_one_provider.dart';
import 'package:game_app/providers/game/game_three_provider.dart';
import 'package:game_app/providers/game/game_two_provider.dart';
import 'package:game_app/providers/mode_change_provider.dart';
import 'package:game_app/providers/user_provider.dart';
import 'package:game_app/providers/video_screen_provider.dart';
import 'package:game_app/views/splash_screen/splash.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ModeProvider()),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => RegisterProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => CategoryProvider()),
        ChangeNotifierProvider(create: (context) => VideoScreenProvider()),
        ChangeNotifierProvider(create: (context) => GameOneProvider()),
        ChangeNotifierProvider(create: (context) => GameTwoProvider()),
        ChangeNotifierProvider(create: (context) => GameThreeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ASD App',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: SplashScreen(),
      //Responsive design
      builder: (context, widget) => ResponsiveWrapper.builder(
        widget,
        maxWidth: 1200,
        minWidth: 480,
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.resize(480, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: TABLET),
          ResponsiveBreakpoint.resize(1000, name: DESKTOP),
        ],
        background: Container(
          color: Color(0xFFF5F5F5),
        ),
      ),
    );
  }
}
