import 'package:disneyplus/screens/detailpage/models/movie_information.dart';
import 'package:disneyplus/screens/save_half_modal.dart';
import 'package:flutter/material.dart';

class SavePage extends StatefulWidget {
  const SavePage({super.key});

  @override
  State<StatefulWidget> createState() => _SavePageState();
}

class _SavePageState extends State<SavePage> {
  List<MovieInformation> savedMovieInformation = [
    MovieInformation("크루엘라", "2시간 17분", "Assets/CarouselImage1.jpg", 2023,
        "로맨스", "170MB", "잘가라!!!")
  ];

  Padding savedMovieCell(MovieInformation movie) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Flexible(
            flex: 4,
            child: Image(
              image: AssetImage(movie.imageURL!),
            ),
          ),
          const SizedBox(width: 7.0),
          Flexible(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  movie.name!,
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "${movie.size} • ${movie.runningTime}",
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return SaveHalfModal(
                      context: context,
                      movieName: movie.name!,
                      onTapped: () {
                        setState(() {
                          savedMovieInformation.removeWhere(
                              (movieInfo) => movieInfo.name == movie.name);
                        });
                      },
                    );
                  },
                );
              },
              icon: const IconTheme(
                data: IconThemeData(
                  color: Colors.white,
                  size: 26,
                ),
                child: Icon(Icons.download_done_outlined),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "수정",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "저장한 콘텐츠",
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                  ),
                ),
                ...savedMovieInformation.map((item) {
                  return savedMovieCell(item);
                }).toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
