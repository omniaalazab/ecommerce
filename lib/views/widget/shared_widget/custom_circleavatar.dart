// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CategoryImage extends StatelessWidget {
  CategoryImage({
    super.key,
    required this.imagePath,
    // required this.color
  });
  String imagePath;
  // Color color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 70,

      child: Image(
        image: AssetImage(imagePath),
        //height: 29,
      ),
      // child: Container(
      //   height: 35,
      //   color: color,
      // )
    );
  }
}
