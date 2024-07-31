import 'package:ecommerce/helper/text_style_helper.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RowTitle extends StatelessWidget {
  RowTitle(
      {super.key,
      required this.firstTitle,
      required this.tapFunction,
      required this.secondTitle});
  String firstTitle;
  String secondTitle;
  void Function()? tapFunction;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            firstTitle,
            style: TextStyleHelper.textStylefontSize16.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          InkWell(
            onTap: tapFunction,
            child: Text(
              secondTitle,
              style: TextStyleHelper.textStylefontSize16.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
