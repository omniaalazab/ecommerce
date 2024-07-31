// ignore_for_file: must_be_immutable

import 'package:ecommerce/helper/color_helper.dart';
import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  RatingBar({
    super.key,
    required this.rating,
    this.size = 18,
    this.ratingCount,
  });
  double rating;
  int? ratingCount;
  double size;
  @override
  Widget build(BuildContext context) {
    List<Widget> startList = [];
    int realNumber = rating.floor();
    int partNumber = ((rating - realNumber) * 10).ceil();

    for (int i = 0; i < 5; i++) {
      if (i < realNumber) {
        startList.add(Icon(
          Icons.star,
          color: ColorHelper.lightPurple,
          size: size,
        ));
      } else if (i == realNumber) {
        startList.add(SizedBox(
          height: size,
          width: size,
          child: Stack(
            children: [
              Icon(
                Icons.star,
                color: ColorHelper.lightPurple,
                size: size,
              ),
              ClipRect(
                  clipper: Clipper(parts: partNumber),
                  child: Icon(
                    Icons.star,
                    color: Colors.grey,
                    size: size,
                  ))
            ],
          ),
        ));
      } else {
        startList.add(Icon(
          Icons.star,
          color: Colors.grey,
          size: size,
        ));
      }
    }
    return Row(mainAxisSize: MainAxisSize.min, children: startList);
  }
}

class Clipper extends CustomClipper<Rect> {
  Clipper({required this.parts});

  int parts;
  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(
        (size.width / 10) * parts, 0.0, size.width, size.height);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) => true;
}
