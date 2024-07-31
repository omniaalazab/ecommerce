// ignore_for_file: must_be_immutable

import 'package:ecommerce/helper/text_style_helper.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton(
      {super.key,
      required this.buttonText,
      required this.onPressedFunction,
      required this.backColor,
      required this.fontColor,
      this.buttonText2 = "",
      this.sideColor,
      this.fontWeight = FontWeight.normal,
      this.textSize = 16,
      this.alignButton = MainAxisAlignment.spaceBetween,
      this.widthButton = double.infinity});
  final String buttonText;
  final String buttonText2;
  final double textSize;
  final Color backColor;
  final Color fontColor;
  late Color? sideColor;
  final FontWeight fontWeight;
  final double widthButton;
  final Function()? onPressedFunction;
  final MainAxisAlignment alignButton;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressedFunction,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(widthButton, 55),
          backgroundColor: backColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
              side: const BorderSide(
                  // color: sideColor ??= ColorHelper.orange,
                  )),
        ),
        child: Row(
          mainAxisAlignment: alignButton,
          children: [
            Text(
              buttonText,
              style: TextStyleHelper.textStylefontSize20.copyWith(
                  fontWeight: fontWeight, color: fontColor, fontSize: textSize),
            ),
            Text(
              buttonText2,
              style: TextStyleHelper.textStylefontSize20.copyWith(
                  fontWeight: fontWeight, color: fontColor, fontSize: textSize),
            ),
          ],
        ));
  }
}
