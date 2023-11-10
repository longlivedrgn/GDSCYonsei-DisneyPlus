import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:disneyplus/screens/detailpage/models/movie_information.dart';
import 'package:flutter/material.dart';
import 'category.dart';
import 'poster.dart';
import 'header_title.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //READ 컬렉션 내 모든 데이터를 가져올때
  Future<List<MovieInformation>> getMovies() async {
    CollectionReference<Map<String, dynamic>> collectionReference =
        FirebaseFirestore.instance.collection("movies");
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await collectionReference.get();

    List<MovieInformation> movies = [];
    for (var doc in querySnapshot.docs) {
      MovieInformation movieInformation =
          MovieInformation.fromQuerySnapshot(doc);
      movies.add(movieInformation);
    }
    return movies;
  }

  int selectedIndex = 0;
  final List<String> thumbNailItems = [
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

// MediaQuery.of(context).size.width
  CarouselSlider mainMoviesCarouselSlider() {
    return CarouselSlider(
      items: thumbNailItems.map(
        (item) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.asset(item),
            ),
          );
        },
      ).toList(),
      options: CarouselOptions(
        // ✅ 아래와 같이 aspect ratio를 맞췄는데도 ratio가 제대로 맞춰서 나오지 않는다.
        aspectRatio: 16 / 9,

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

  Container categoriesContainer(List<Category> categories) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.15,
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
          title: Image.asset("Assets/mainDisneyLogo.png",
              width: MediaQuery.of(context).size.width * 0.3)),
      body: FutureBuilder<List<MovieInformation>>(
          future: getMovies(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(); // 로딩 중일 때 표시할 위젯
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              List<MovieInformation> movies = snapshot.data ?? [];
              return Container(
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
                          children: movies.map(
                            (item) {
                              return Poster(imageAssetPath: item.imageURL!);
                            },
                          ).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          }),
    );
  }
}
