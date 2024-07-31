import 'package:ecommerce/helper/color_helper.dart';
import 'package:ecommerce/helper/text_style_helper.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TitlePageRow extends StatelessWidget {
  TitlePageRow({
    required this.pageTitle,
    required this.onPressedBackButton,
    super.key,
  });
  String pageTitle;
  Function() onPressedBackButton;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: ColorHelper.purple,
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: onPressedBackButton,
            //  () {
            //   Navigator.pop(context);
            // },
          ),
        ),
        const SizedBox(
          width: 40,
        ),
        Text(
          pageTitle,
          style: TextStyleHelper.textStylefontSize20
              .copyWith(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
