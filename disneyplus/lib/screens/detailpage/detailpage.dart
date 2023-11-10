import 'package:disneyplus/screens/detailpage/detail_button.dart';
import 'package:disneyplus/screens/save_half_modal.dart';
import 'package:flutter/material.dart';
import 'models/movie_information.dart';

class DetailPage extends StatefulWidget {
  final MovieInformation movieInformation;
  const DetailPage({required this.movieInformation, super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isSaved = false;

  void updateSaveButton() {
    setState(() {
      if (isSaved == false) {
        isSaved = !isSaved;
      } else {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return SaveHalfModal(
              context: context,
              movieName: widget.movieInformation.name!,
              onTapped: () {
                setState(() {
                  isSaved = false;
                });
              },
            );
          },
        );
      }
    });
  }

  Container moviePosterImage(double width, double height) {
    return Container(
      height: height,
      width: width,
      // margin: const EdgeInsets.only(
      //   left: 15.0,
      // ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(widget.movieInformation.imageURL!),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
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
                "${widget.movieInformation.openDate} • ${widget.movieInformation.runningTime} • ${widget.movieInformation.genre}",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DetailButton(
                    text: "관심 콘텐츠",
                    icon: Icons.add,
                    triggerAction: updateSaveButton,
                  ),
                  const SizedBox(width: 50), // give it width
                  DetailButton(
                    text: "예고편",
                    icon: Icons.movie,
                    triggerAction: updateSaveButton,
                  ),
                  const SizedBox(width: 50), // give it width
                  DetailButton(
                    text: "저장",
                    icon: isSaved ? Icons.download_done : Icons.download,
                    triggerAction: updateSaveButton,
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  widget.movieInformation.summary!,
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
