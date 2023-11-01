import 'package:disneyplus/screens/detailpage/detail_button.dart';
import 'package:flutter/material.dart';
import 'models/movie_information.dart';

class DetailPage extends StatelessWidget {
  final MovieInformation movieInformation;
  const DetailPage({required this.movieInformation, super.key});

  Container moviePosterImage(double width, double height) {
    return Container(
      height: height,
      width: width,
      // margin: const EdgeInsets.only(
      //   left: 15.0,
      // ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(movieInformation.imageURL),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: Theme.of(context).primaryColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              moviePosterImage(MediaQuery.of(context).size.height * 0.5,
                  MediaQuery.of(context).size.width),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Text(
                "${movieInformation.openDate} • ${movieInformation.runningTime} • ${movieInformation.genre}",
                style: const TextStyle(color: Colors.grey, fontSize: 17),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                  child: const Text(
                    "▶️ 재생",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DetailButton(
                    text: "관심 콘텐츠",
                    icon: Icons.add,
                    movieURL: ,
                  ),
                  SizedBox(width: 50), // give it width
                  DetailButton(
                    text: "예고편",
                    icon: Icons.movie,
                  ),
                  SizedBox(width: 50), // give it width
                  DetailButton(
                    text: "저장",
                    icon: Icons.download,
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  movieInformation.summary,
                  style: const TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
