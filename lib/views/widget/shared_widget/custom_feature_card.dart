// ignore_for_file: must_be_immutable

import 'package:ecommerce/helper/color_helper.dart';
import 'package:ecommerce/helper/text_style_helper.dart';
import 'package:flutter/material.dart';

class FeatureCard extends StatelessWidget {
  FeatureCard(
      {super.key,
      required this.imagePath,
      required this.productName,
      required this.price});
  String imagePath;
  String price;
  String productName;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image(
            image: AssetImage(imagePath),
            width: 150,
            height: 180,
          ),
          Text(
            price,
            style: TextStyleHelper.textStylefontSize16.copyWith(
                fontWeight: FontWeight.bold,
                color: ColorHelper.grey.withOpacity(.7)),
          ),
          Text(
            productName,
            style: TextStyleHelper.textStylefontSize16.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
