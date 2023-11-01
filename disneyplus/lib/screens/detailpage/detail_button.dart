import 'package:disneyplus/screens/playerpage/movie_player_page.dart';
import 'package:flutter/material.dart';

class DetailButton extends StatelessWidget {
  final String text;
  final IconData icon;
  // ✅ button이 movie 값을 가지고 있는 것은 부자연스럽다!..
  final String? movieURL;

  const DetailButton(
      {super.key, required this.text, required this.icon, this.movieURL});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MoviePlayerPage(youtubeURL: movieURL),
              ),
            );
          },
          icon: Icon(
            icon,
            size: 40,
            color: Colors.white,
          ),
        ),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
