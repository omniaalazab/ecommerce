// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ListViewBuilder extends StatelessWidget {
  ListViewBuilder({super.key, required this.itemCount, required this.builder});
  Widget? Function(BuildContext, int) builder;

  int itemCount;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //color: ColorHelper.purple,
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: builder,
        itemCount: itemCount,
      ),
    );
  }
}
