import 'package:ecommerce/helper/color_helper.dart';
import 'package:ecommerce/helper/text_style_helper.dart';
import 'package:flutter/material.dart';

class CardDetailsContainer extends StatelessWidget {
  const CardDetailsContainer({
    super.key,
    required this.productImagePath,
    required this.productName,
    required this.size,
    required this.color,
    required this.productPrice,
    required this.productQuantity,
    required this.onPressedFunction,
  });

  final String productImagePath;
  final String productName;
  final String size;
  final String color;
  final int productPrice;
  final int productQuantity;
  final Function()? onPressedFunction;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: ColorHelper.purple),
        width: MediaQuery.of(context).size.width,
        height: 110,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Column(
                children: [
                  Container(
                    width: 60,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      //),
                      image: DecorationImage(
                        image: NetworkImage(
                          productImagePath,
                        ),
                      ),

                      // child: Image(
                      //   image: NetworkImage(productImagePath),
                      //   // width: 80,
                      //   // height: 80,
                      //   //),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 5,
              ),
              Container(
                alignment: Alignment.center,
                width: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Text(productName,
                            style: TextStyleHelper.textStylefontSize13
                                .copyWith(fontWeight: FontWeight.w500)),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Size - ",
                            style: TextStyleHelper.textStylefontSize14.copyWith(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500)),
                        Text(" $size",
                            style: TextStyleHelper.textStylefontSize14),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Color - ",
                            style: TextStyleHelper.textStylefontSize14.copyWith(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500)),
                        Text(" $color",
                            style: TextStyleHelper.textStylefontSize14),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 25,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("\$$productPrice",
                      style: TextStyleHelper.textStylefontSize14
                          .copyWith(fontWeight: FontWeight.w500)),
                  Text('No.Item : $productQuantity',
                      style: TextStyleHelper.textStylefontSize14
                          .copyWith(fontWeight: FontWeight.w500)),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: onPressedFunction,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
