import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/controller/get_specific_product.dart';
import 'package:ecommerce/helper/color_helper.dart';
import 'package:ecommerce/helper/text_style_helper.dart';

import 'package:ecommerce/views/ui/categories.dart';

import 'package:ecommerce/views/widget/shared_widget/grid_view_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Hoodies extends StatefulWidget {
  const Hoodies({super.key});

  @override
  State<Hoodies> createState() => _HoodiesState();
}

class _HoodiesState extends State<Hoodies> {
  late Query hoodyQuery;
  @override
  void initState() {
    context
        .read<GetSpecificProductCubit>()
        .getTypeProduct(typeProduct: "hoody");
    //  hoodyQuery = GetSpecificProduct.getProduct(typeProduct: 'hoody');
    super.initState();
  }

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
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const ShopByCategory()));
                },
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              "Hoodies",
              style: TextStyleHelper.textStylefontSize20
                  .copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child:
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
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    ));
  }
}
