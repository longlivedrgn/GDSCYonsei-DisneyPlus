import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category(
      {super.key, required this.width, required this.imageAssetPath});
  final double width;
  final String imageAssetPath;

  @override
  Widget build(Object context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 1.0,
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(3.0),
          topRight: Radius.circular(3.0),
          bottomRight: Radius.circular(3.0),
          bottomLeft: Radius.circular(3.0),
        ),
      ),
      padding: const EdgeInsets.all(10),
      child: Image.asset(imageAssetPath),
    );
  }
}
