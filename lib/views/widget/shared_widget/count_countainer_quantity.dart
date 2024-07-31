import 'package:ecommerce/helper/color_helper.dart';
import 'package:ecommerce/helper/text_style_helper.dart';
import 'package:flutter/material.dart';

class CountContainer extends StatelessWidget {
  const CountContainer({
    super.key,
    required this.countSign,
  });

  final String countSign;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 30,
      width: 30,
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: ColorHelper.lightPurple),
      child: Text(countSign, style: TextStyleHelper.textStylefontSize18),
    );
  }
}
