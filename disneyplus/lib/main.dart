import 'package:disneyplus/screens/savepage/save_page.dart';
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
        nextScreen: const DisneyPlusScreen(),
      ),
    );
  }
}

class DisneyPlusScreen extends StatefulWidget {
  const DisneyPlusScreen({super.key});

  @override
  State<StatefulWidget> createState() => _DisneyPlusScreenStae();
}

class _DisneyPlusScreenStae extends State<DisneyPlusScreen> {
  final List<Widget> widgetOptions = <Widget>[
    const MyHomePage(),
    const SavePage(),
    const MyHomePage(),
    const MyHomePage(),
  ];

  int selectedIndex = 0;

  void onItemTapped(int index) {
    // 탭을 클릭했을떄 지정한 페이지로 이동
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
          title: Image.asset("Assets/mainDisneyLogo.png",
              width: MediaQuery.of(context).size.width * 0.3)),
      body: SafeArea(child: widgetOptions.elementAt(selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.file_download_rounded), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
        currentIndex: selectedIndex,
        onTap: onItemTapped,
      ),
    );
  }
}
