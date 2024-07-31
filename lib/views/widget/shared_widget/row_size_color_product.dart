// ignore_for_file: must_be_immutable

import 'package:ecommerce/helper/color_helper.dart';
import 'package:ecommerce/helper/text_style_helper.dart';
import 'package:ecommerce/views/widget/shared_widget/bottom_size_sheet.dart';
import 'package:ecommerce/views/widget/shared_widget/count_countainer_quantity.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class RowSizeColorProduct extends StatefulWidget {
  RowSizeColorProduct({
    required this.itemNameList,
    required this.listName,
    required this.isCount,
    //required this.appearSelectedItem,
    required this.onItemSelected,
    required this.choosenColorList,
    required this.selectedSizeIndex,
    this.checkIsColor = true,
    required this.countQuantity,
    required this.onQuantityChanged,
    super.key,
  });
  List<Color> choosenColorList;
  List<String> itemNameList;
  String listName;
  bool isCount = false;
  int countQuantity;
  // Widget appearSelectedItem;
  final Function(int) onItemSelected;

  final Function(int) onQuantityChanged;
  int? selectedSizeIndex;
  bool checkIsColor;
  @override
  State<RowSizeColorProduct> createState() => _RowSizeColorProductState();
}

class _RowSizeColorProductState extends State<RowSizeColorProduct> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        //height: 400,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: ColorHelper.purple,
            borderRadius: BorderRadiusDirectional.circular(30)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              width: 20,
            ),
            Text(widget.listName, style: TextStyleHelper.textStylefontSize18),
            const SizedBox(
              width: 110,
            ),
            const SizedBox(
              width: 20,
            ),
            widget.isCount
                ? SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width * .3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                            onTap: () {
                              //   widget.onIcrease;
                              setState(() {
                                widget.countQuantity = widget.countQuantity + 1;
                                widget.onQuantityChanged(widget.countQuantity);
                              });
                            },
                            child: const CountContainer(countSign: "+")),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '${widget.countQuantity}',
                          style: TextStyleHelper.textStylefontSize14,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                            onTap: () {
                              //   widget.onDecrease;
                              // },
                              // {
                              if (widget.countQuantity <= 1) {
                                widget.countQuantity = 1;
                              } else {
                                setState(() {
                                  widget.countQuantity =
                                      widget.countQuantity - 1;
                                  widget
                                      .onQuantityChanged(widget.countQuantity);
                                });
                              }
                            },
                            child: const CountContainer(countSign: "-")),
                      ],
                    ),
                  )
                : Row(
                    children: [
                      // selectedIndex == null
                      //     ? const SizedBox(
                      //         width: 10,
                      //       )
                      //     : SizedBox(
                      //         width: 40,
                      //         child: widget.selectedSizeIndex == null
                      //             ? Text(
                      //                 "Hellow",
                      //                 style:
                      //                     TextStyleHelper.textStylefontSize19,
                      //               )
                      //             : Text(
                      //                 widget.itemNameList[
                      //                     widget.selectedSizeIndex!],
                      //                 style:
                      //                     TextStyleHelper.textStylefontSize16,
                      //               ),
                      //       ),
                      widget.checkIsColor
                          ? CircleAvatar(
                              radius: 20,
                              backgroundColor: widget.choosenColorList[
                                  widget.selectedSizeIndex ?? 0],
                            )
                          : Text(
                              widget
                                  .itemNameList[widget.selectedSizeIndex ?? 0],
                              style: TextStyleHelper.textStylefontSize16,
                            ),
                      IconButton(
                          onPressed: () {
                            Get.bottomSheet(BottomSizeSheet(
                              onItemSelected: widget.onItemSelected,
                              choosenColorList: widget.choosenColorList,
                              listName: widget.listName,
                              itemNameList: widget.itemNameList,
                            ));
                          },
                          icon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Colors.white,
                          )),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
