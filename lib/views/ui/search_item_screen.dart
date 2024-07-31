import 'dart:developer';


import 'package:ecommerce/controller/search/search_cubit.dart';
import 'package:ecommerce/controller/search/search_state.dart';
import 'package:ecommerce/helper/color_helper.dart';
import 'package:ecommerce/helper/text_style_helper.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/views/ui/categories.dart';
import 'package:ecommerce/views/ui/product_details.dart';
import 'package:ecommerce/views/widget/shared_widget/custom_button.dart';
import 'package:ecommerce/views/widget/shared_widget/custom_top_selling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SearchItemsScreen extends StatefulWidget {
  const SearchItemsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchItemsScreenState createState() => _SearchItemsScreenState();
}

class _SearchItemsScreenState extends State<SearchItemsScreen> {
  final TextEditingController searchController = TextEditingController();
  

  @override
  void initState() {
    super.initState();

    
    searchController.addListener(onChange);
    context.read<SearchCubit>.getFirestoreDocuments();
    log("**************************************");
  }

  void onChange() {
    log(searchController.text);
    searchCubit.searchResultList(searchController.text);
  }

  @override
  void dispose() {
    searchController.removeListener(onChange);
    searchController.dispose();
    super.dispose();
  }

  String searchTerm = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => searchCubit,
        child: BlocBuilder<SearchCubit, SearchStatus>(
          builder: (context, state) {
            if (state is SearchLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SearchLoaded || state is SearchSuccess) {
              final products = (state is SearchLoaded)
                  ? state.products
                  : (state as SearchSuccess).products;
              return buildSearchResults(context, products);
            } else if (state is SearchFailure) {
              return Center(child: Text(state.errorMessage));
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget buildSearchResults(BuildContext context, List<Product> products) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          const SizedBox(height: 50),
          Row(
            children: [
              CircleAvatar(
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  style: TextStyleHelper.textStylefontSize15,
                  controller: searchController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.search_rounded,
                      size: 30,
                    ),
                    labelText: 'Search',
                    labelStyle: TextStyleHelper.textStylefontSize13.copyWith(
                      color: Colors.white,
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        searchController.clear();
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: products.isNotEmpty
                ? GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                  )
                : buildNoResults(),
          ),
        ],
      ),
    );
  }

  Widget buildNoResults() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Image(
          image: AssetImage("assets/images/bell 1.png"),
          height: 250,
          width: 100,
        ),
        const SizedBox(height: 20),
        Text(
          "Sorry, we can't find any result for your search",
          style: TextStyleHelper.textStylefontSize20.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        CustomElevatedButton(
          alignButton: MainAxisAlignment.center,
          buttonText: "Explore categories",
          onPressedFunction: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const ShopByCategory(),
              ),
            );
          },
          backColor: ColorHelper.lightPurple,
          fontColor: Colors.white,
          widthButton: 50,
        ),
      ],
    );
  }
}
      //  Padding(
      //   padding: const EdgeInsets.all(10.0),
      //   child: Column(
      //     children: [
      //       const SizedBox(height: 40),
      //       Row(
      //         children: [
      //           CircleAvatar(
      //             child: IconButton(
      //               icon: const Icon(Icons.arrow_back_ios_new_rounded),
      //               onPressed: () {
      //                 Navigator.pop(context);
      //               },
      //             ),
      //           ),
      //           const SizedBox(width: 10),
      //           Expanded(
      //             child: TextField(
      //               style: TextStyleHelper.textStylefontSize15,
      //               controller: searchController,
      //               decoration: InputDecoration(
      //                 prefixIcon: const Icon(Icons.search_rounded, size: 30),
      //                 labelText: 'Search',
      //                 labelStyle: TextStyleHelper.textStylefontSize13.copyWith(
      //                   color: Colors.white,
      //                 ),
      //                 suffixIcon: IconButton(
      //                   icon: const Icon(Icons.clear),
      //                   onPressed: () {
      //                     searchController.clear();
      //                     setState(() {
      //                       searchTerm = '';
      //                     });
      //                   },
      //                 ),
      //               ),
      //               // onChanged: (value) {
      //               //   setState(() {
      //               //     searchTerm = value.toLowerCase().trim();
      //               //   });
      //               // },
      //             ),
      //           ),
      //         ],
      //       ),
      //       Expanded(
      //         child: resultProductList.isNotEmpty
      //             ? GridView.builder(
      //                 gridDelegate:
      //                     const SliverGridDelegateWithFixedCrossAxisCount(
      //                   crossAxisCount: 2,
      //                   childAspectRatio: 2.5 / 3,
      //                   mainAxisSpacing: 20,
      //                   crossAxisSpacing: 10,
      //                 ),
      //                 itemCount: resultProductList.length,
      //                 itemBuilder: (context, index) {
      //                   final product = resultProductList[index];
      //                   return InkWell(
      //                     onTap: () {
      //                       Navigator.push(
      //                         context,
      //                         MaterialPageRoute(
      //                           builder: (_) =>
      //                               ProductDetails(product: product),
      //                         ),
      //                       );
      //                     },
      //                     child: TopSellingContainer(product: product),
      //                   );
      //                 },
      //               )
      //             : Column(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: [
      //                   const Image(
      //                     image: AssetImage("assets/images/bell 1.png"),
      //                     height: 250,
      //                     width: 100,
      //                   ),
      //                   const SizedBox(height: 20),
      //                   Text(
      //                     "Sorry, we can't find any result for your search",
      //                     style: TextStyleHelper.textStylefontSize20.copyWith(
      //                       fontWeight: FontWeight.bold,
      //                     ),
      //                   ),
      //                   const SizedBox(height: 20),
      //                   CustomElevatedButton(
      //                     alignButton: MainAxisAlignment.center,
      //                     buttonText: "Explore categories",
      //                     onPressedFunction: () {
      //                       Navigator.pushReplacement(
      //                         context,
      //                         MaterialPageRoute(
      //                           builder: (_) => const ShopByCategory(),
      //                         ),
      //                       );
      //                     },
      //                     backColor: ColorHelper.lightPurple,
      //                     fontColor: Colors.white,
      //                     widthButton: 50,
      //                   ),
      //                 ],
      //               ),
      //       ),

            // Expanded(
            //   child: StreamBuilder<QuerySnapshot>(
            //     stream: searchTerm == ''
            //         ? FirebaseFirestore.instance
            //             .collection('products')
            //             .snapshots()
            //         : FirebaseFirestore.instance
            //             .collection('products')
            //             .where('title_lower',
            //                 isGreaterThanOrEqualTo: searchTerm)
            //             .where('title_lower', isLessThan: '$searchTerm\uf8ff')
            //             .snapshots(),
            //     builder: (context, snapshot) {
            //       if (snapshot.hasError) {
            //         return Center(
            //           child: Text('Error: ${snapshot.error}'),
            //         );
            //       }

            //       if (snapshot.connectionState == ConnectionState.waiting) {
            //         return const Center(
            //           child: Center(child: CircularProgressIndicator()),
            //         );
            //       }

            //       if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
            //         return Center(
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               const Image(
            //                 image: AssetImage("assets/images/bell 1.png"),
            //                 height: 250,
            //                 width: 100,
            //               ),
            //               const SizedBox(height: 20),
            //               Text(
            //                 "Sorry, we can't find any result for your search",
            //                 style: TextStyleHelper.textStylefontSize20.copyWith(
            //                   fontWeight: FontWeight.bold,
            //                 ),
            //               ),
            //               const SizedBox(height: 20),
            //               CustomElevatedButton(
            //                 alignButton: MainAxisAlignment.center,
            //                 buttonText: "Explore categories",
            //                 onPressedFunction: () {
            //                   Navigator.pushReplacement(
            //                     context,
            //                     MaterialPageRoute(
            //                       builder: (_) => const ShopByCategory(),
            //                     ),
            //                   );
            //                 },
            //                 backColor: ColorHelper.lightPurple,
            //                 fontColor: Colors.white,
            //                 widthButton: 50,
            //               ),
            //             ],
            //           ),
            //         );
            //       } else {
            //         return GridViewBuilder(
            //           streamSnapShot: snapshot,
            //         );
            //       }
            //     },
            //   ),
            // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
