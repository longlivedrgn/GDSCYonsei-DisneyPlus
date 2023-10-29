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
          image: AssetImage(movieInformation.movieImageURL),
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
            ],
          ),
        ),
      ),
    );
  }
}
