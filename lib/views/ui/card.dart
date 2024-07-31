import 'package:ecommerce/controller/card/add_to_card_cubit.dart';
import 'package:ecommerce/controller/card/add_to_card_state.dart';
import 'package:ecommerce/helper/color_helper.dart';
import 'package:ecommerce/helper/text_style_helper.dart';
import 'package:ecommerce/views/ui/check_out.dart';
import 'package:ecommerce/views/ui/home.dart';
import 'package:ecommerce/views/widget/shared_widget/calc_shipping_cost.dart';
import 'package:ecommerce/views/widget/shared_widget/card_details_container.dart';
import 'package:ecommerce/views/widget/shared_widget/custom_button.dart';
import 'package:ecommerce/views/widget/shared_widget/custom_title_pagerow.dart';
import 'package:ecommerce/views/widget/shared_widget/text_form_field.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class AddCard extends StatelessWidget {
  AddCard({
    super.key,
  });

  int shippingCost = 8;
  int tax = 0;
  TextEditingController couponCodeController = TextEditingController();
  int quantity = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: ColorHelper.darkpurple,
        body: BlocBuilder<CardCubit, CartState>(builder: (context, state) {
      if (state.cartItems.isEmpty) {
        return Center(
          child: Container(
            width: 300,
            height: 400,
            alignment: Alignment.center,
            child: Column(
              children: [
                const Image(
                  image: AssetImage("assets/images/parcel 1.png"),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text("Your card is empty",
                    style: TextStyleHelper.textStylefontSize20
                        .copyWith(fontWeight: FontWeight.w500)),
                const SizedBox(
                  height: 10,
                ),
                CustomElevatedButton(
                  alignButton: MainAxisAlignment.center,
                  widthButton: 50,
                  backColor: ColorHelper.lightPurple,
                  buttonText: "Explore Categories",
                  fontWeight: FontWeight.w700,
                  fontColor: Colors.white,
                  onPressedFunction: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => const Home()));
                  },
                )
              ],
            ),
          ),
        );
      } else {
        int totalPrice = 0;
        for (var cartItem in state.cartItems) {
          totalPrice += cartItem.product.price * cartItem.quantity;
        }
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 25, 10, 10),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                TitlePageRow(
                    pageTitle: "Cart",
                    onPressedBackButton: () {
                      Navigator.pop(context);
                    }),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .45,
                  child: ListView.builder(
                      itemCount: state.cartItems.length,
                      itemBuilder: (context, index) {
                        final cartItem = state.cartItems[index];

                        return CardDetailsContainer(
                          productImagePath: cartItem.product.imageUrl,
                          productName: cartItem.product.name,
                          size: cartItem.size,
                          color: cartItem.color,
                          productPrice: cartItem.product.price,
                          productQuantity: cartItem.quantity,
                          onPressedFunction: () {
                            context
                                .read<CardCubit>()
                                .removeFromCart(cartItem.id);
                          },
                        );
                      }),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .3,
                  child: Column(
                    children: [
                      CalcShippingCost(
                          titleDetailCost: "SubTotal", price: "\$ $totalPrice"),
                      CalcShippingCost(
                          titleDetailCost: "Shipping cost",
                          price: "$shippingCost"),
                      CalcShippingCost(titleDetailCost: "Tax", price: '\$$tax'),
                      CalcShippingCost(
                          titleDetailCost: "Total",
                          price: "\$${shippingCost + totalPrice + tax}"),
                      CustomAllTextField(
                          suffix: CircleAvatar(
                            radius: 10,
                            backgroundColor: ColorHelper.lightPurple,
                            child: const Icon(Icons.arrow_forward_ios_rounded),
                          ),
                          prefix: const Image(
                              image: AssetImage(
                                  "assets/images/discountshape.png")),
                          labelText: "Enter Coupon Code",
                          textFieldController: couponCodeController,
                          validatorFunction: (value) {
                            return null;
                          }),
                    ],
                  ),
                ),
                CustomElevatedButton(
                    buttonText: "Check out",
                    onPressedFunction: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (_) => CheckOut(
                                  numberOfOrderItems: state.cartItems.length,
                                  totalPrice: totalPrice,
                                  shippingCost: shippingCost,
                                  tax: tax)));
                    },
                    backColor: ColorHelper.lightPurple,
                    alignButton: MainAxisAlignment.center,
                    fontColor: Colors.white)
              ],
            ),
          ),
        );
      }
    }));
  }
}
