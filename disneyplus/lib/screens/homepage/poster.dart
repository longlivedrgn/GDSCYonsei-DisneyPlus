import 'package:disneyplus/screens/detailpage/detailpage.dart';
import 'package:disneyplus/screens/detailpage/models/movie_information.dart';
import 'package:flutter/material.dart';

class Poster extends StatelessWidget {
  const Poster({super.key, required this.imageAssetPath});
  final String imageAssetPath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context, rootNavigator: true).push(
          MaterialPageRoute(
            builder: (context) => DetailPage(
              movieInformation: MovieInformation(
                  "라라랜드", 2023, "1시간 30분", "로맨스", imageAssetPath),
            ),
          ),
        );
      },
      child: Container(
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
      ),
    );
  }
}
