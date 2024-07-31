// ignore_for_file: must_be_immutable

import 'package:ecommerce/controller/order/order_cubit.dart';
import 'package:ecommerce/controller/order/order_state.dart';
import 'package:ecommerce/helper/color_helper.dart';
import 'package:ecommerce/helper/text_style_helper.dart';
import 'package:ecommerce/views/ui/categories.dart';
import 'package:ecommerce/views/ui/order_detail.dart';
import 'package:ecommerce/views/widget/shared_widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Order extends StatelessWidget {
  Order({super.key, required this.address, required this.numberOfOrdedItems});
  bool isOrderd = false;
  int numberOfOrdedItems;
  String address;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //  backgroundColor: ColorHelper.darkpurple,
        body: BlocBuilder<OrderCubit, OrderState>(builder: (context, state) {
      if (state.orderModel.isEmpty) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('assets/images/check-out 1.png'),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'No Order Yet',
              style: TextStyleHelper.textStylefontSize20
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 30,
            ),
            CustomElevatedButton(
                alignButton: MainAxisAlignment.center,
                buttonText: "Explore Category",
                fontWeight: FontWeight.w500,
                textSize: 18,
                onPressedFunction: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const ShopByCategory()));
                },
                backColor: ColorHelper.lightPurple,
                fontColor: Colors.white),
          ],
        );
      } else {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              Text(
                'Orders',
                style: TextStyleHelper.textStylefontSize18.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .45,
                child: ListView.builder(
                  itemCount: state.orderModel.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorHelper.purple),
                          child: ListTile(
                            leading: const Image(
                              image: AssetImage('assets/images/Frame 52.png'),
                            ),
                            title: Text(
                              "Order ${state.orderModel[index].orderId} ",
                              style: TextStyleHelper.textStylefontSize15,
                            ),
                            subtitle: Text(
                              " ${state.orderModel[index].numberOfItems}  items",
                              style: TextStyleHelper.textStylefontSize13,
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => OrderDetails(
                                              address: address,
                                              orderModel:
                                                  state.orderModel[index],
                                            )));
                              },
                              icon: const Icon(Icons.arrow_forward_ios_rounded),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }
    }));
  }
}
