import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:disneyplus/screens/detailpage/detailpage.dart';
import 'package:disneyplus/screens/detailpage/models/movie_information.dart';
import 'package:flutter/material.dart';

class Poster extends StatelessWidget {
  const Poster({super.key, required this.movie});
  final MovieInformation movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context, rootNavigator: true).push(
          MaterialPageRoute(
            builder: (context) => DetailPage(movieInformation: movie),
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
            image: AssetImage(movie.imageURL!),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
