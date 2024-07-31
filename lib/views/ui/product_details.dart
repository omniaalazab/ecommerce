// ignore_for_file: avoid_types_as_parameter_names

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/controller/card/add_to_card_cubit.dart';
import 'package:ecommerce/controller/favourite/favourite_cubit.dart';
import 'package:ecommerce/helper/color_helper.dart';
import 'package:ecommerce/helper/text_style_helper.dart';
import 'package:ecommerce/model/product_model.dart';

import 'package:ecommerce/views/ui/categories.dart';

import 'package:ecommerce/views/widget/shared_widget/custom_button.dart';

import 'package:ecommerce/views/widget/shared_widget/dialog_toast.dart';

import 'package:ecommerce/views/widget/shared_widget/rating_bar.dart';
import 'package:ecommerce/views/widget/shared_widget/row_size_color_product.dart';
import 'package:ecommerce/views/widget/shared_widget/zoomed_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({
    super.key,
    // required this.imagePath,
    // required this.productTitle,
    required this.product,
  });
  final Product product;
  // String imagePath;
  // String productTitle;
  // int productPrice;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool isFavourite = false;

  List<String> sizeList = ['S', 'M', 'L', 'XL'];

  List<Color> colorList = [
    Colors.orange,
    Colors.greenAccent,
    Colors.white,
    Colors.black,
    Colors.blue,
    Colors.red,
    Colors.yellow,
  ];

  List<String> colorNameList = [
    "orange",
    "greenAccent",
    'white',
    "black",
    "blue",
    "red",
    "yellow",
  ];

  // final CollectionReference selectedProduct =
  //     FirebaseFirestore.instance.collection("products");

  int? selectedSizeIndex;
  int? selectedColorIndex;
  int productQuantity = 1;
  void onSizeSelected(int index) {
    setState(() {
      selectedSizeIndex = index;
      log("$selectedSizeIndex");
    });
  }

  void onQuantityChanged(int quantity) {
    setState(() {
      productQuantity = quantity;
    });
  }

  // void onIncrease(int count) {
  //   setState(() {
  //     count = count + 1;
  //   });
  // }

  // void onDecrease(int count) {
  //   setState(() {
  //     if (count == 0) {
  //       productQuantity = 0;
  //     } else {
  //       productQuantity = count - 1;
  //     }
  //   });
  // }

  void onColorSelected(int index) {
    setState(() {
      selectedColorIndex = index;
      log("$selectedColorIndex");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: ColorHelper.darkpurple,
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 40, 15, 0),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: ColorHelper.purple,
                      child: InkWell(
                        child: const Icon(Icons.arrow_back_ios_new_rounded),
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const ShopByCategory()));
                        },
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        context
                            .read<FavoriteCubit>()
                            .toggleFavorite(widget.product);
                        setState(() {
                          isFavourite = !isFavourite;
                        });
                      },
                      icon:
                          //isFavourite?

                          const Icon(Icons.favorite),
                      // : const Icon(Icons.favorite_border_rounded),
                      color: isFavourite ? Colors.red : Colors.white,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 180,
                  width: MediaQuery.of(context).size.width,
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ZoomableImageScreen(
                                  imageUrl: widget.product.imageUrl),
                            ));
                      },
                      child:
                          Image(image: NetworkImage(widget.product.imageUrl))),
                ),
                Text(
                  widget.product.name,
                  style: TextStyleHelper.textStylefontSize18
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                Text(
                  '\$${widget.product.price}',
                  style: TextStyleHelper.textStylefontSize18
                      .copyWith(color: ColorHelper.lightPurple),
                ),
                const SizedBox(
                  height: 30,
                ),
                RowSizeColorProduct(
                  onQuantityChanged: onQuantityChanged,
                  countQuantity: 1,
                  selectedSizeIndex: selectedSizeIndex,
                  onItemSelected: onSizeSelected,
                  isCount: false,
                  checkIsColor: false,
                  choosenColorList: const [],
                  listName: "Size",
                  itemNameList: sizeList,
                ),
                const SizedBox(
                  height: 5,
                ),
                RowSizeColorProduct(
                  onQuantityChanged: onQuantityChanged,
                  countQuantity: 0,
                  selectedSizeIndex: selectedColorIndex,
                  onItemSelected: onColorSelected,
                  isCount: false,
                  choosenColorList: colorList,
                  listName: "Color",
                  itemNameList: colorNameList,
                ),
                const SizedBox(
                  height: 5,
                ),
                RowSizeColorProduct(
                  checkIsColor: false,
                  selectedSizeIndex: 0,
                  // onDecrease: onDecrease,
                  // onIcrease: onIncrease,
                  onQuantityChanged: onQuantityChanged,
                  countQuantity: productQuantity,
                  onItemSelected: (int) {},
                  // appearSelectedItem: const SizedBox(
                  //   width: .5,
                  // ),
                  isCount: true,
                  choosenColorList: const [],
                  listName: "Quantity",
                  itemNameList: const [],
                ),
                const SizedBox(
                  height: 40,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Text(
                        "Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.",
                        style: TextStyleHelper.textStylefontSize12
                            .copyWith(color: ColorHelper.grey),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child:
                      // Column(
                      //   children: [
                      Text(
                    "Shipping & Returns",
                    style: TextStyleHelper.textStylefontSize18
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text("Free Standard shipping and free 60 day returns",
                      style: TextStyleHelper.textStylefontSize12
                          .copyWith(color: ColorHelper.grey)),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Reviews",
                    style: TextStyleHelper.textStylefontSize18
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "4.5 Ratings",
                    style: TextStyleHelper.textStylefontSize18
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text("213 Reviews",
                      style: TextStyleHelper.textStylefontSize12
                          .copyWith(color: ColorHelper.grey)),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage("assets/images/review1.png"),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text("Alex Mogan",
                        style: TextStyleHelper.textStylefontSize16
                            .copyWith(fontWeight: FontWeight.w700)),
                    const SizedBox(
                      width: 90,
                    ),
                    RatingBar(
                      ratingCount: 213,
                      rating: 3.5,
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                    "Gucci transcribes its heritage, creativity, and innovation into a plenitude of collections. From staple items to distinctive accessories.",
                    style: TextStyleHelper.textStylefontSize16
                        .copyWith(color: ColorHelper.grey)),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage("assets/images/review2.png"),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text("Alex Mogan",
                        style: TextStyleHelper.textStylefontSize16
                            .copyWith(fontWeight: FontWeight.w700)),
                    const SizedBox(
                      width: 90,
                    ),
                    RatingBar(
                      ratingCount: 213,
                      rating: 3.5,
                    ),
                  ],
                ),
                Text(
                    "Gucci transcribes its heritage, creativity, and innovation into a plenitude of collections. From staple items to distinctive accessories.",
                    style: TextStyleHelper.textStylefontSize16
                        .copyWith(color: ColorHelper.grey)),
                //   ],
                // ),
                //),
                const SizedBox(
                  height: 150,
                ),
                CustomElevatedButton(
                  buttonText: "\$${widget.product.price * productQuantity}",
                  buttonText2: "Add to Bag",
                  onPressedFunction: () {
                    if (productQuantity == 0) {
                      CreateDialogToaster.showErrorToast(
                          "Please choose quantity of choosen item");
                    } else {
                      CreateDialogToaster.showSucessToast(
                          "Item was added sucessfuly");
                      context.read<CardCubit>().addToCart(
                            widget.product,
                            sizeList[selectedSizeIndex ?? 0],
                            colorNameList[selectedColorIndex ?? 0],
                            productQuantity,
                          );
                    }
                  },
                  backColor: ColorHelper.lightPurple,
                  fontColor: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
