// ignore_for_file: must_be_immutable

import 'package:ecommerce/helper/color_helper.dart';
import 'package:ecommerce/helper/text_style_helper.dart';
import 'package:flutter/material.dart';

class CategorySearch extends StatelessWidget {
  CategorySearch({
    required this.categoryImage,
    required this.categoryName,
    required this.onPressedFunction,
    super.key,
  });
  String categoryName;
  String categoryImage;
  final Function()? onPressedFunction;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressedFunction,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorHelper.purple,
        ),
        child: Row(
          children: [
            Image(
              image: AssetImage(categoryImage),
              height: 60,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(categoryName, style: TextStyleHelper.textStylefontSize15),
          ],
        ),
      ),
    );
  }
}
