import 'dart:ffi';

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
        nextScreen: const MyHomePage(),
      ),
      // const MyHomePage(title: 'Happy'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class Category extends StatelessWidget {
  const Category(
      {super.key, required this.width, required this.imageAssetPath});
  final double width;
  final String imageAssetPath;

  @override
  Widget build(Object context) {
    return Container(
      width: width,
      margin: const EdgeInsets.symmetric(horizontal: 1.0),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 1.0,
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(3.0),
            topRight: Radius.circular(3.0),
            bottomRight: Radius.circular(3.0),
            bottomLeft: Radius.circular(3.0),
          ),
          image: DecorationImage(
              image: Image.asset(imageAssetPath).image,
              fit: BoxFit.contain) // 정확히 뭔지는 찾아보기!...
          ),
    );
  }
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
              Container(
                height: MediaQuery.of(context).size.width * 0.15,
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // Categories("assets/images/categories/disney.png"),
                    // Categories("assets/images/categories/pixar.png"),
                    // Categories("assets/images/categories/starwars.png")
                  ],
                ),
              ),
              // Container(
              //   color: Colors.black,
              //   width: 100,
              //   height: 300,
              // ),

              // GridView.count(
              //   crossAxisCount: 3,
              //   childAspectRatio: 2 / 1,
              //   mainAxisSpacing: 0, // 수평 Padding
              //   crossAxisSpacing: 0, // 수직 Padding
              //   children: [
              //     Container(color: Colors.amber),
              //     Container(color: Colors.amber),
              //     Container(color: Colors.amber),
              //     Container(color: Colors.amber),
              //     Container(color: Colors.amber),
              //     Container(color: Colors.amber),
              //     Container(color: Colors.amber),
              //   ],
              // )
            ],
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
