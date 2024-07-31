// ignore_for_file: must_be_immutable

import 'package:ecommerce/helper/color_helper.dart';
import 'package:ecommerce/helper/text_style_helper.dart';
import 'package:ecommerce/views/widget/shared_widget/bottom_sheet_list_view__builder.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class BottomSizeSheet extends StatefulWidget {
  BottomSizeSheet({
    super.key,
    required this.itemNameList,
    required this.listName,
    required this.choosenColorList,
    required this.onItemSelected,
  });
  String listName;
  List<String> itemNameList;
  List<Color>? choosenColorList;
  final Function(int) onItemSelected;
  @override
  State<BottomSizeSheet> createState() => _BottomSizeSheetState();
}

class _BottomSizeSheetState extends State<BottomSizeSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          decoration: BoxDecoration(color: ColorHelper.darkpurple),
          height: 370,
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(widget.listName,
                      style: TextStyleHelper.textStylefontSize18),
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.clear, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  child: BottomSheetListViewBuilder(
                onItemSelected: widget.onItemSelected,
                itemNameList: widget.itemNameList,
                choosenColorList: widget.choosenColorList,
              )),
            ],
          ),
        ));
  }
}
