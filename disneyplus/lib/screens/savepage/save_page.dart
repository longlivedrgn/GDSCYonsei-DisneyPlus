import 'package:disneyplus/screens/detailpage/models/movie_information.dart';
import 'package:disneyplus/screens/save_half_modal.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SavePage extends StatefulWidget {
  const SavePage({super.key});

  @override
  State<StatefulWidget> createState() => _SavePageState();
}

class _SavePageState extends State<SavePage> {
  late List<MovieInformation> savedMovies;

  @override
  void initState() {
    super.initState();
    fetchSavedMovies();
  }

  Future<void> fetchSavedMovies() async {
    List<MovieInformation> movies = await getSavedMovies();
    setState(() {
      savedMovies = movies;
    });
  }

  Future<List<MovieInformation>> getSavedMovies() async {
    CollectionReference<Map<String, dynamic>> collectionReference =
        FirebaseFirestore.instance.collection("movies");
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await collectionReference.where("isSaved", isEqualTo: true).get();

    List<MovieInformation> movies = [];
    for (var doc in querySnapshot.docs) {
      MovieInformation movieInformation =
          MovieInformation.fromQuerySnapshot(doc);
      movies.add(movieInformation);
    }
    return movies;
  }

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
                          savedMovies.removeWhere(
                              (movieInfo) => movieInfo.name == movie.name);
                          FirebaseFirestore.instance
                              .collection("movies")
                              .doc(movie.docID)
                              .update(
                            {
                              "isSaved": !movie.isSaved!,
                            },
                          );
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
      body: FutureBuilder<List<MovieInformation>>(
        future: getSavedMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(); // 로딩 중일 때 표시할 위젯
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            // List<MovieInformation> movies = snapshot.data ?? [];

            return SizedBox(
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
                      ...savedMovies.map((item) {
                        return savedMovieCell(item);
                      }).toList(),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
