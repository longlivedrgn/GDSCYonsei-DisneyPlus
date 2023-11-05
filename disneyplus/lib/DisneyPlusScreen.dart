import 'package:flutter/material.dart';
import 'screens/homepage/my_homepage.dart';
import 'package:disneyplus/screens/savepage/save_page.dart';

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
