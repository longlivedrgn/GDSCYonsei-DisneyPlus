import 'package:flutter/material.dart';
import 'screens/homepage/my_homepage.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xff4a5275),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff131a4a)),
        useMaterial3: true,
      ),
      home: AnimatedSplashScreen(
        backgroundColor: Colors.black,
        splash: SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Image.asset(
            "Assets/disneyPlusLaunch.gif",
            // ✅ width와 height를 설정하고, fill로 하면 안될까?..
            fit: BoxFit.fitWidth,
          ),
        ),
        splashTransition: SplashTransition.fadeTransition,
        nextScreen: const MyHomePage(),
      ),
    );
  }
}
