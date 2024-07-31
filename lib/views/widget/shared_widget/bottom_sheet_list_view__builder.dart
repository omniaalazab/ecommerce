// ignore_for_file: must_be_immutable

import 'package:ecommerce/helper/color_helper.dart';
import 'package:ecommerce/helper/text_style_helper.dart';
import 'package:flutter/material.dart';

class BottomSheetListViewBuilder extends StatefulWidget {
  BottomSheetListViewBuilder({
    super.key,
    required this.itemNameList,
    this.choosenColorList,
    required this.onItemSelected,
  });

  final List<String> itemNameList;
  List<Color>? choosenColorList;
  final Function(int) onItemSelected;
  @override
  State<BottomSheetListViewBuilder> createState() =>
      _BottomSheetListViewBuilderState();
}

class _BottomSheetListViewBuilderState
    extends State<BottomSheetListViewBuilder> {
  int? selectedIndexSizeColor;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.itemNameList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: selectedIndexSizeColor == index
                        ? ColorHelper.lightPurple
                        : ColorHelper.purple),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      selectedIndexSizeColor = index;
                    });
                    widget.onItemSelected(index);
                  },
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: 120,
                        child: Text(
                          widget.itemNameList[index],
                          style: TextStyleHelper.textStylefontSize16,
                        ),
                      ),
                      widget.choosenColorList == null ||
                              widget.choosenColorList!.isEmpty
                          ? const SizedBox(
                              width: 20,
                            )
                          : SizedBox(
                              width: MediaQuery.of(context).size.width * .40,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(
                                    width: 100,
                                  ),
                                  Container(
                                    alignment: Alignment.bottomRight,
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: widget.choosenColorList![index],
                                    ),
                                  ),
                                ],
                              ),
                            )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          );
        });
  }
}
