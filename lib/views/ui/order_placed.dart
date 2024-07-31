import 'package:ecommerce/helper/color_helper.dart';
import 'package:ecommerce/helper/text_style_helper.dart';
import 'package:ecommerce/views/ui/order.dart';
import 'package:ecommerce/views/widget/shared_widget/custom_button.dart';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OrderPlaced extends StatelessWidget {
  OrderPlaced(
      {super.key,
      required this.isMailSend,
      required this.address,
      required this.numberOfOrderItems});
  int numberOfOrderItems;
  String address;
  bool isMailSend;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: ColorHelper.darkpurple,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .45,
                width: MediaQuery.of(context).size.width,
                color: ColorHelper.lightPurple,
                child: const Image(
                  image: AssetImage("assets/images/image 3.png"),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .5,
                width: MediaQuery.of(context).size.width,
                // color: ColorHelper.darkpurple,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 190,
                      height: 80,
                      child: Text("Order Placed Successfully",
                          style: TextStyleHelper.textStylefontSize24
                              .copyWith(fontWeight: FontWeight.w700)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    isMailSend
                        ? Text("You will recieve Email Confirmation",
                            style: TextStyleHelper.textStylefontSize16.copyWith(
                                fontWeight: FontWeight.w500,
                                color: ColorHelper.grey))
                        : Text(
                            "We can't send you  Email Confirmation . please try later... ",
                            style: TextStyleHelper.textStylefontSize16.copyWith(
                                fontWeight: FontWeight.w500,
                                color: ColorHelper.grey)),
                    const SizedBox(
                      height: 100,
                    ),
                    CustomElevatedButton(
                        fontWeight: FontWeight.w500,
                        textSize: 18,
                        buttonText: "See Order details",
                        alignButton: MainAxisAlignment.center,
                        onPressedFunction: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => Order(
                                        address: address,
                                        numberOfOrdedItems: numberOfOrderItems,
                                      )));
                        },
                        backColor: ColorHelper.lightPurple,
                        fontColor: Colors.white)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
