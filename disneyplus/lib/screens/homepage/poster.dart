import 'dart:math';

import 'package:flutter/material.dart';

class Poster extends StatelessWidget {
  const Poster({super.key, required this.imageAssetPath});
  final String imageAssetPath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => debugPrint("뭔데!.."),
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
