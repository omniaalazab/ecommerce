import 'package:ecommerce/helper/color_helper.dart';
import 'package:ecommerce/helper/text_style_helper.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListTileCheckout extends StatelessWidget {
  ListTileCheckout({
    super.key,
    required this.titleListtile,
    required this.subTitleListtile,
    required this.listTileColor,
    //  required this.listTileOnPressed,
    required this.trailingOfCheckout,
    this.imagePayment = const SizedBox(
      height: 10,
    ),
    // this.cardTypeIcon = "",
  });
  String titleListtile;
  String subTitleListtile;
  Widget? imagePayment;
  Color listTileColor;
  // String cardTypeIcon;
  // Function()? listTileOnPressed;
  Widget? trailingOfCheckout;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorHelper.purple,
      ),
      child: ListTile(
        //  tileColor: ColorHelper.lightPurple,
        title: Row(
          children: [
            Text(
              titleListtile,
              style: TextStyleHelper.textStylefontSize13
                  .copyWith(color: ColorHelper.grey),
            ),
            SizedBox(
              height: 30,
              width: 30,
              child: imagePayment,
            )
          ],
        ),
        subtitle: Text(
          subTitleListtile,
          style: TextStyleHelper.textStylefontSize16
              .copyWith(fontWeight: FontWeight.w500),
        ),
        trailing: trailingOfCheckout,
      ),
    );
  }
}
