import 'package:ecommerce/helper/color_helper.dart';
import 'package:ecommerce/helper/text_style_helper.dart';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailedOrderInformationRow extends StatelessWidget {
  DetailedOrderInformationRow({
    super.key,
    required this.followOrderINfo,
    required this.dateTimeOrder,
  });
  String followOrderINfo;

  String dateTimeOrder;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Container(
        //   child:
        Row(
          children: [
            CircleAvatar(
              backgroundColor: ColorHelper.lightPurple,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(followOrderINfo, style: TextStyleHelper.textStylefontSize16),
          ],
        ),
        // ),
        Text(dateTimeOrder, style: TextStyleHelper.textStylefontSize16),
      ],
    );
  }
}
