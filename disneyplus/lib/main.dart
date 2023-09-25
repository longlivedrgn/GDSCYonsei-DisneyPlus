import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color(0xff4a5275),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff131a4a)),
        useMaterial3: true,
      ),
      home: AnimatedSplashScreen(
        backgroundColor: Theme.of(context).primaryColor,
        splash: Image.asset("Assets/disneyPlusLaunch.gif"),
        splashTransition: SplashTransition.fadeTransition,
        nextScreen: const MyHomePage(title: 'Happy'),
      ),
      // const MyHomePage(title: 'Happy'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final List<String> thumbNailItem = [
    "Assets/CarouselImage1.jpg",
    "Assets/CarouselImage2.jpg",
    "Assets/CarouselImage3.jpg",
    "Assets/CarouselImage4.jpg",
    "Assets/CarouselImage5.jpg",
    "Assets/CarouselImage6.jpg",
    "Assets/CarouselImage7.jpg",
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // MediaQueryData deviceData = MediaQuery.of(context);
    // Size screenSize = deviceData.size;
    // int selectedIndex = 0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Image.asset(
          "Assets/disneyWhiteLogo.png",
          width: 100, // 하드코딩된 거 변경하기!~!~
          height: 100,
        ),
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                CarouselSlider(
                  items: thumbNailItem.map(
                    (item) {
                      return Builder(
                        builder: (BuildContext context) {
                          return SizedBox(
                            width: MediaQuery.of(context).size.width,
                            // margin: const EdgeInsets.symmetric(horizontal: 10),
                            // decoration: const BoxDecoration(color: Colors.amber),
                            child: AspectRatio(
                              aspectRatio: 16 / 9,
                              child: Image.asset(item),
                            ),
                          );
                        },
                      );
                    },
                  ).toList(),
                  options: CarouselOptions(
                    // // Set the height of each carousel item
                    // height: 400,

                    // Set the size of each carousel item
                    // if height is not specified
                    // ✅ 아래와 같이 aspect ratio를 맞췄는데도 ratio가 제대로 맞춰서 나오지 않는다.
                    aspectRatio: 16 / 9,

                    // Set how much space current item widget
                    // will occupy from current page view
                    //
                    // viewportFraction: 0.8,

                    // Set the initial page
                    initialPage: 0,

                    // Set carousel to repeat when reaching the end
                    enableInfiniteScroll: true,

                    // Set carousel to scroll in opposite direction
                    reverse: false,

                    // Set carousel to display next page automatically
                    autoPlay: true,

                    // Set the duration of which carousel slider will wait
                    // in current page utill it moves on to the next
                    autoPlayInterval: const Duration(seconds: 3),

                    // // Set the duration of carousel slider
                    // // scrolling to the next page
                    // autoPlayAnimationDuration: const Duration(milliseconds: 800),

                    // Set the carousel slider animation
                    autoPlayCurve: Curves.fastOutSlowIn,

                    // Set the current page to be displayed
                    // bigger than previous or next page
                    enlargeCenterPage: true,

                    // Do actions for each page change
                    onPageChanged: (index, reason) {},

                    // Set the scroll direction
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Theme.of(context).colorScheme.primary,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.file_download_rounded), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
