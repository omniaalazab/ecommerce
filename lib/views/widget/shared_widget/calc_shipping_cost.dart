// ignore_for_file: must_be_immutable

import 'package:ecommerce/helper/color_helper.dart';
import 'package:ecommerce/helper/text_style_helper.dart';
import 'package:flutter/material.dart';

class CalcShippingCost extends StatelessWidget {
  CalcShippingCost({
    required this.price,
    required this.titleDetailCost,
    super.key,
  });
  String titleDetailCost;
  String price;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(titleDetailCost,
              style: TextStyleHelper.textStylefontSize14
                  .copyWith(color: ColorHelper.grey)),
          Text(price, style: TextStyleHelper.textStylefontSize14),
        ],
      ),
    );
  }
}
