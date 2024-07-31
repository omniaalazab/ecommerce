import 'package:ecommerce/helper/color_helper.dart';
import 'package:ecommerce/helper/text_style_helper.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SettingContainerRow extends StatelessWidget {
  SettingContainerRow({
    required this.rowTitle,
    required this.onPressed,
    super.key,
  });
  String rowTitle;
  Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: ColorHelper.purple),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(rowTitle, style: TextStyleHelper.textStylefontSize19),
            IconButton(
                onPressed: onPressed,
                icon: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: ColorHelper.grey,
                ))
          ],
        ),
      ),
    );
  }
}
