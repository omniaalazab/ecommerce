import 'package:ecommerce/controller/get_specific_product/get_specific_product_cubit.dart';
import 'package:ecommerce/controller/get_specific_product/get_specific_product_state.dart';
import 'package:ecommerce/helper/color_helper.dart';
import 'package:ecommerce/helper/text_style_helper.dart';
import 'package:ecommerce/views/ui/categories.dart';

import 'package:ecommerce/views/widget/shared_widget/grid_view_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Shoes extends StatefulWidget {
  const Shoes({super.key});

  @override
  State<Shoes> createState() => _ShoesState();
}

class _ShoesState extends State<Shoes> {
  // late var shoesQuery;
  @override
  void initState() {
    context
        .read<GetSpecificProductCubit>()
        .getTypeProduct(typeProduct: "shoes");
    super.initState();
  }

  // final Query shoesQuery = FirebaseFirestore.instance
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //  backgroundColor: ColorHelper.darkpurple,
        body: Center(
            child: Padding(
      padding: const EdgeInsets.fromLTRB(15, 40, 15, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 25,
          ),
          CircleAvatar(
            backgroundColor: ColorHelper.purple,
            child: InkWell(
              child: const Icon(Icons.arrow_back_ios_new_rounded),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const ShopByCategory()));
              },
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            "Shoes",
            style: TextStyleHelper.textStylefontSize20
                .copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10,
          ),
          BlocBuilder<GetSpecificProductCubit, SpecificProductStatus>(
            builder: (context, state) {
              if (state is SpecificProductLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is SpecificProductSuccess) {
                final products = (state).products;
                return GridViewBuilder(
                  products: products,
                );
              } else if (state is SpecificProductFailure) {
                return Center(child: Text(state.errorMessage));
              } else {
                return Container();
              }
            },

            // ),
            //          StreamBuilder(
            //             stream: shoesQuery.snapshots(),
            //             builder:
            //                 (context, AsyncSnapshot<QuerySnapshot> streamSnapShot) {
            //               if (streamSnapShot.hasData) {
            //                 return GridViewBuilder(
            //                   streamSnapShot: streamSnapShot,
            //                 );
            //               }
            //               return const Center(child: CircularProgressIndicator());
            //             }),
          )
        ],
      ),
    )));
  }
}
