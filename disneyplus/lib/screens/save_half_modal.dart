import 'package:flutter/material.dart';

class SaveHalfModal extends StatelessWidget {
  const SaveHalfModal({
    super.key,
    required this.context,
    required this.movieName,
    required this.onTapped,
  });

  final BuildContext context;
  final String movieName;
  final Function onTapped;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3, // 모달 높이 크기
      decoration: const BoxDecoration(
        color: Color(0xff131a4a),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0), // 모달 좌상단 라운딩 처리
          topRight: Radius.circular(0), // 모달 우상단 라운딩 처리
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 0.4,
                    color: Colors.black,
                  ),
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.1,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  movieName,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              child: const Row(
                children: [
                  IconTheme(
                    data: IconThemeData(
                      color: Colors.white,
                      size: 26,
                    ),
                    child: Icon(Icons.play_arrow),
                  ),
                  SizedBox(
                    width: 20,
                  ), // give it width

                  Text(
                    "재생",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                onTapped();
                // setState(() {
                //   isSaved = false;
                // });
                Navigator.pop(context);
              },
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
                child: const Row(
                  children: [
                    IconTheme(
                      data: IconThemeData(
                        color: Colors.white,
                        size: 26,
                      ),
                      child: Icon(Icons.delete),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "저장삭제",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
