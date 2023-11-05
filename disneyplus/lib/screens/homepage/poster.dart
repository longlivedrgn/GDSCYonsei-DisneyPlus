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
                "라라랜드",
                "1시간 30분",
                imageAssetPath,
                openDate: 2023,
                genre: "로맨스",
                summary:
                    "헐리우드 배우지망생 미아와 재즈바를 차리는게 꿈인 피아노 연주자 세바스찬은 우연히 만나 서로의 꿈을 응원하는 연인 사이가 된다.",
              ),
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
