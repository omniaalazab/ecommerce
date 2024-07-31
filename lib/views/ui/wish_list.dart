import 'package:ecommerce/controller/favourite/favourite_cubit.dart';
import 'package:ecommerce/controller/favourite/favourite_state.dart';

import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/views/ui/product_details.dart';
import 'package:ecommerce/views/widget/shared_widget/custom_title_pagerow.dart';
import 'package:ecommerce/views/widget/shared_widget/custom_top_selling.dart';
import 'package:ecommerce/views/widget/shared_widget/zoomed_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   backgroundColor: ColorHelper.lightPurple,
      body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 25, 10, 10),
          child: Column(children: [
            const SizedBox(
              height: 40,
            ),
            TitlePageRow(
                pageTitle: "Favorite",
                onPressedBackButton: () {
                  Navigator.pop(context);
                }),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<FavoriteCubit, FavoriteState>(
                builder: (context, state) {
              if (state.favoriteItems.isEmpty) {
                return const Center(
                  child: Text("No items in the wishlist"),
                );
              }

              return Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2.5 / 3,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: state.favoriteItems.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                product: Product(
                                    name: state.favoriteItems[index].name,
                                    imageUrl:
                                        state.favoriteItems[index].imageUrl,
                                    price: state.favoriteItems[index].price),
                              ),
                            ));
                      },
                      child: TopSellingContainer(
                        product: Product(
                            name: state.favoriteItems[index].name,
                            imageUrl: state.favoriteItems[index].imageUrl,
                            price: state.favoriteItems[index].price),
                      ),
                    );
                  },
                ),
              );
            })
          ])),
    );
  }
}
