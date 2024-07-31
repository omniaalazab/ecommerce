// ignore_for_file: must_be_immutable

import 'package:ecommerce/helper/text_style_helper.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:flutter/material.dart';

class TopSellingContainer extends StatelessWidget {
  TopSellingContainer({
    super.key,
    required this.product,
    this.originalPrice,
  });
  Product product;
  // String imageUrl;
  // String title;
  // int price;
  int? originalPrice;
  // Item items;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        //color: ColorHelper.purple
      ),
      width: 160,
      height: 500,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
              width: 160,
              height: 140,
              // width: 180,
            ),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              product.name,
              style: TextStyleHelper.textStylefontSize12.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              children: [
                Text(
                  '\$${product.price}',
                  style: TextStyleHelper.textStylefontSize15.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (originalPrice != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      '\$$originalPrice',
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
