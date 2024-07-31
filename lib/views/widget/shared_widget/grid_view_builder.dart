// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/views/ui/product_details.dart';
import 'package:ecommerce/views/widget/shared_widget/custom_top_selling.dart';
import 'package:flutter/material.dart';

class GridViewBuilder extends StatelessWidget {
  GridViewBuilder({
    required this.products,
    super.key,
  });
  List<Product> products;
  late Product product;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2.5 / 3,
        mainAxisSpacing: 20,
        crossAxisSpacing: 10,
      ),
      itemCount: products.length,
      itemBuilder: (_, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ProductDetails(
                  product: products[index],
                ),
              ),
            );
          },
          child: TopSellingContainer(product: products[index]),
        );
      },
    );
    // return GridView.builder(
    //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //       crossAxisCount: 2,
    //       childAspectRatio: 2.5 / 3,
    //       mainAxisSpacing: 20,
    //       crossAxisSpacing: 10,
    //     ),
    //     // physics: const NeverScrollableScrollPhysics(),
    //     // shrinkWrap: true,
    //     itemCount: streamSnapShot.data!.docs.length,
    //     itemBuilder: (_, index) {
    //       final DocumentSnapshot documentSnapShot =
    //           streamSnapShot.data!.docs[index];
    //       // product = Product(
    //       //     id: documentSnapShot['id'],
    //       //     imageUrl: documentSnapShot['imageUrl'],
    //       //     name: documentSnapShot['title'],
    //       //     price: documentSnapShot['price']);
    //       return InkWell(
    //         onTap: () {
    //           Navigator.push(
    //               context,
    //               MaterialPageRoute(
    //                   builder: (_) => ProductDetails(
    //                         product: Product(
    //                             id: documentSnapShot['id'],
    //                             imageUrl: documentSnapShot['imageUrl'],
    //                             name: documentSnapShot['title'],
    //                             price: documentSnapShot['price']),
    //                         // imagePath: documentSnapShot['imageUrl'],
    //                         // productPrice: documentSnapShot['price'],
    //                         // productTitle: documentSnapShot['title'],
    //                       )));
    //         },
    //         child: TopSellingContainer(
    //           product: Product(
    //               id: documentSnapShot['id'],
    //               imageUrl: documentSnapShot['imageUrl'],
    //               name: documentSnapShot['title'],
    //               price: documentSnapShot['price']),
    //           // imageUrl: documentSnapShot['imageUrl'],
    //           // price: documentSnapShot['price'],
    //           // title: documentSnapShot['title'],
    //         ),
    //       );
    //     });
  }
}
