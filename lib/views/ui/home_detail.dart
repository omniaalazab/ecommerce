import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/controller/profile/profile_cubit.dart';
import 'package:ecommerce/controller/profile/profile_state.dart';
import 'package:ecommerce/controller/search/search_cubit.dart';

import 'package:ecommerce/controller/theme_cubit.dart';
import 'package:ecommerce/helper/color_helper.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/views/ui/search_item_screen.dart';
import 'package:ecommerce/views/ui/accessories.dart';
import 'package:ecommerce/views/ui/bags.dart';
import 'package:ecommerce/views/ui/card.dart';
import 'package:ecommerce/views/ui/categories.dart';
import 'package:ecommerce/views/ui/hoodies.dart';
import 'package:ecommerce/views/ui/product_details.dart';
import 'package:ecommerce/views/ui/shoes.dart';
import 'package:ecommerce/views/ui/shorts.dart';
import 'package:ecommerce/views/widget/shared_widget/custom_circleavatar.dart';
import 'package:ecommerce/views/widget/shared_widget/custom_top_selling.dart';
import 'package:ecommerce/views/widget/shared_widget/dialog_toast.dart';
import 'package:ecommerce/views/widget/shared_widget/list_view_builder.dart';
import 'package:ecommerce/views/widget/shared_widget/row_title.dart';
import 'package:ecommerce/views/widget/shared_widget/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeDetails extends StatefulWidget {
  const HomeDetails({super.key});

  @override
  State<HomeDetails> createState() => _HomeDetailsState();
}

class _HomeDetailsState extends State<HomeDetails> {
  TextEditingController searchController = TextEditingController();
  final CollectionReference ecommerce =
      FirebaseFirestore.instance.collection("Ecommerce");
  final CollectionReference newCollection =
      FirebaseFirestore.instance.collection("newsColllection");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          //  BlocConsumer<SearchCubit, SearchStatus>(
          //   listener: (context, state) {
          //     if (state is SearchFailure) {
          //       CreateDialogToaster.showErrorToast(state.errorMessage);
          //     }  else if (state is SearchSuccess) {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (_) => const SearchItemsScreen()),
          //       );
          //     }
          //   },
          //   builder: (context, state) {
          //     return
          SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 50, 10, 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BlocConsumer<ProfileCubit, ProfileStatus>(
                      listener: (context, state) {
                        if (state is ProfileFailure) {
                          CreateDialogToaster.showErrorToast(
                              "Oops, there is an error");
                        } else if (state is ProfilLoading) {
                          CreateDialogToaster.showErrorDialogDefult(
                              "Loading", "Image Profile Loading");
                        }
                      },
                      builder: (context, state) {
                        if (state is ProfileSuccess) {
                          return InkWell(
                            onTap: () {
                              context
                                  .read<ProfileCubit>()
                                  .changeProfileImage(context);
                            },
                            child: CircleAvatar(
                              backgroundImage: state.imageProvider,
                              radius: 30,
                            ),
                          );
                        } else {
                          return InkWell(
                            onTap: () {
                              context
                                  .read<ProfileCubit>()
                                  .changeProfileImage(context);
                            },
                            child: const CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/Ellipse 13.png"),
                              radius: 30,
                            ),
                          );
                        }
                      },
                    ),
                    Switch(
                      value:
                          context.watch<ThemeCubit>().state == ThemeMode.dark,
                      onChanged: (value) {
                        context.read<ThemeCubit>().toggleTheme(value);
                      },
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => AddCard()));
                      },
                      child: CircleAvatar(
                        radius: 20,
                        child: Image.asset('assets/images/Frame 32.png'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 40,
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: ColorHelper.purple,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: CustomAllTextField(
                      labelText: "Search ",
                      suffix: IconButton(
                        onPressed: () async {
                          context.read<SearchCubit>().getFirestoreDocuments();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const SearchItemsScreen()));
                        },
                        icon: const Icon(Icons.arrow_drop_down_circle_rounded),
                      ),
                      textFieldController: searchController,
                      prefix: const Icon(
                        Icons.search_rounded,
                        size: 30,
                      ),
                      validatorFunction: (value) {
                        return null;
                      },
                    ),
                  ),
                ),
                RowTitle(
                  firstTitle: "Category",
                  secondTitle: "See All",
                  tapFunction: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const ShopByCategory()),
                    );
                  },
                ),
                SizedBox(
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const Hoodies()));
                        },
                        child: CategoryImage(
                          imagePath: 'assets/images/Frame 3.png',
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const Shorts()));
                        },
                        child: CategoryImage(
                          imagePath: 'assets/images/Frame 1.png',
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => const Shoes()));
                        },
                        child: CategoryImage(
                          imagePath: 'assets/images/Frame 2.png',
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => const Bags()));
                        },
                        child: CategoryImage(
                          imagePath: 'assets/images/Frame 4.png',
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const Accessories()));
                        },
                        child: CategoryImage(
                          imagePath: 'assets/images/Frame 5.png',
                        ),
                      ),
                    ],
                  ),
                ),
                RowTitle(
                  firstTitle: "Top Selling",
                  secondTitle: "See All",
                  tapFunction: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const ShopByCategory()),
                    );
                  },
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: ecommerce.snapshots(),
                  builder:
                      (context, AsyncSnapshot<QuerySnapshot> streamSnapShot) {
                    if (streamSnapShot.hasData) {
                      return ListViewBuilder(
                        itemCount: streamSnapShot.data!.docs.length,
                        builder: (context, index) {
                          final DocumentSnapshot documentSnapShot =
                              streamSnapShot.data!.docs[index];
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ProductDetails(
                                    product: Product(
                                      id: documentSnapShot['id'],
                                      name: documentSnapShot['title'],
                                      imageUrl: documentSnapShot['imageUrl'],
                                      price: documentSnapShot['price'],
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: TopSellingContainer(
                              product: Product(
                                id: documentSnapShot['id'],
                                name: documentSnapShot['title'],
                                imageUrl: documentSnapShot['imageUrl'],
                                price: documentSnapShot['price'],
                              ),
                              originalPrice: documentSnapShot['originalPrice'],
                            ),
                          );
                        },
                      );
                    }
                    return const CircularProgressIndicator();
                  },
                ),
                RowTitle(
                  tapFunction: () {},
                  firstTitle: "New In",
                  secondTitle: "See All",
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: newCollection.snapshots(),
                  builder:
                      (context, AsyncSnapshot<QuerySnapshot> streamSnapShot) {
                    if (streamSnapShot.hasData) {
                      return ListViewBuilder(
                        itemCount: streamSnapShot.data!.docs.length,
                        builder: (context, index) {
                          final DocumentSnapshot documentSnapShot =
                              streamSnapShot.data!.docs[index];
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ProductDetails(
                                    product: Product(
                                      id: documentSnapShot['id'],
                                      name: documentSnapShot['title'],
                                      imageUrl: documentSnapShot['imageUrl'],
                                      price: documentSnapShot['price'],
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: TopSellingContainer(
                              product: Product(
                                id: documentSnapShot['id'],
                                name: documentSnapShot['title'],
                                imageUrl: documentSnapShot['imageUrl'],
                                price: documentSnapShot['price'],
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return const CircularProgressIndicator();
                  },
                ),
              ],
            ),
          ),
        ),
        //  );
        // },
      ),
    );
  }
}
