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
      ),
      padding: const EdgeInsets.all(10),
      child: Image.asset(imageAssetPath),
    );
  }
}

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.06,
        top: MediaQuery.of(context).size.width * 0.05,
      ),
      alignment: Alignment
          .centerLeft, // Align however you like (i.e .centerRight, centerLeft)
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class Poster extends StatelessWidget {
  const Poster({super.key, required this.imageAssetPath});
  final String imageAssetPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      margin: const EdgeInsets.only(
        left: 15.0,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imageAssetPath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  final List<String> thunbNailItems = [
    "Assets/CarouselImage1.jpg",
    "Assets/CarouselImage2.jpg",
    "Assets/CarouselImage3.jpg",
    "Assets/CarouselImage4.jpg",
    "Assets/CarouselImage5.jpg",
    "Assets/CarouselImage6.jpg",
    "Assets/CarouselImage7.jpg",
  ];

  final List<String> recentItems = [
    "Assets/PosterImage.jpg",
    "Assets/PosterImage.jpg",
    "Assets/PosterImage.jpg",
    "Assets/PosterImage.jpg",
    "Assets/PosterImage.jpg",
    "Assets/PosterImage.jpg",
    "Assets/PosterImage.jpg",
    "Assets/PosterImage.jpg",
    "Assets/PosterImage.jpg",
    "Assets/PosterImage.jpg"
  ];

  final List<String> recommendItems = [
    "Assets/PosterImage.jpg",
    "Assets/PosterImage.jpg",
    "Assets/PosterImage.jpg",
    "Assets/PosterImage.jpg",
    "Assets/PosterImage.jpg",
    "Assets/PosterImage.jpg",
    "Assets/PosterImage.jpg",
    "Assets/PosterImage.jpg",
    "Assets/PosterImage.jpg",
    "Assets/PosterImage.jpg"
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

// MediaQuery.of(context).size.width
  CarouselSlider mainMoviesCarouselSlider() {
    return CarouselSlider(
      items: thunbNailItems.map(
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
    );
  }

  // categories,
  // Category(
  //     width: MediaQuery.of(context).size.width * 0.28,
  //     imageAssetPath: "Assets/CarouselImage1.jpg"),
  // Category(
  //     width: MediaQuery.of(context).size.width * 0.28,
  //     imageAssetPath: "Assets/CarouselImage1.jpg"),
  // Category(
  //     width: MediaQuery.of(context).size.width * 0.28,
  //     imageAssetPath: "Assets/CarouselImage1.jpg"),
  Container categoriesContainer(List<Category> categories) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.15,
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: categories,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: Image.asset(
          "Assets/disneyWhiteLogo.png",
          width: 100, // 하드코딩된 거 변경하기!~!~
          height: 100,
        ),
      ),
      body: Container(
        height: double.infinity,
        color: Theme.of(context).primaryColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              mainMoviesCarouselSlider(),
              categoriesContainer(
                [
                  Category(
                      width: MediaQuery.of(context).size.width * 0.28,
                      imageAssetPath: "Assets/marvel_logo.png"),
                  Category(
                      width: MediaQuery.of(context).size.width * 0.28,
                      imageAssetPath: "Assets/ng_logo.png"),
                  Category(
                      width: MediaQuery.of(context).size.width * 0.28,
                      imageAssetPath: "Assets/pixar_logo.png"),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.03,
              ),
              categoriesContainer(
                [
                  Category(
                      width: MediaQuery.of(context).size.width * 0.28,
                      imageAssetPath: "Assets/star_logo.png"),
                  Category(
                      width: MediaQuery.of(context).size.width * 0.28,
                      imageAssetPath: "Assets/starwars_logo.png"),
                  Category(
                      width: MediaQuery.of(context).size.width * 0.28,
                      imageAssetPath: "Assets/disneyWhiteLogo.png"),
                ],
              ),
              const HeaderTitle(title: "디즈니+ 최신작 "),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                height: MediaQuery.of(context).size.height * 0.23,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: recentItems.map(
                    (item) {
                      return Poster(imageAssetPath: item);
                    },
                  ).toList(),
                ),
              ),
              const HeaderTitle(title: "취향 저격 컨텐츠"),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                height: MediaQuery.of(context).size.height * 0.23,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: recommendItems.map(
                    (item) {
                      return Poster(imageAssetPath: item);
                    },
                  ).toList(),
                ),
              ),
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
          currentIndex: selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
