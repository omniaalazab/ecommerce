import 'package:ecommerce/helper/color_helper.dart';
import 'package:ecommerce/helper/text_style_helper.dart';
import 'package:ecommerce/model/order_model.dart';
import 'package:ecommerce/views/ui/card.dart';
import 'package:ecommerce/views/widget/shared_widget/custom_title_pagerow.dart';
import 'package:ecommerce/views/widget/shared_widget/follow_order_info.dart';
import 'package:ecommerce/views/widget/shared_widget/list_tile_checkout.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OrderDetails extends StatelessWidget {
  OrderDetails({super.key, required this.address, required this.orderModel});
  OrderModel orderModel;

  String address;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   backgroundColor: ColorHelper.darkpurple,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            TitlePageRow(
                pageTitle: "Order ",
                onPressedBackButton: () {
                  Navigator.pop(context);
                }),
            const SizedBox(
              height: 30,
            ),
            DetailedOrderInformationRow(
                followOrderINfo: "Delivered",
                dateTimeOrder: orderModel.deliveredDate),
            const SizedBox(
              height: 30,
            ),
            DetailedOrderInformationRow(
                followOrderINfo: "Shipped",
                dateTimeOrder: orderModel.shippingDate),
            const SizedBox(
              height: 30,
            ),
            DetailedOrderInformationRow(
                followOrderINfo: "Order Confirmed",
                dateTimeOrder: orderModel.orderConfirmDate),
            const SizedBox(
              height: 30,
            ),
            DetailedOrderInformationRow(
                followOrderINfo: "Order Placed",
                dateTimeOrder: orderModel.placedOrderDate),
            const SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text("Order Items",
                  style: TextStyleHelper.textStylefontSize18
                      .copyWith(fontWeight: FontWeight.w500)),
            ),
            const SizedBox(
              height: 20,
            ),
            ListTileCheckout(
              listTileColor: ColorHelper.grey,
              subTitleListtile: "",
              titleListtile: "${orderModel.numberOfItems} items",
              trailingOfCheckout: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => AddCard()));
                  },
                  child: Text("View all",
                      style: TextStyleHelper.textStylefontSize14
                          .copyWith(color: ColorHelper.lightPurple))),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text("Shipping Details",
                  style: TextStyleHelper.textStylefontSize18
                      .copyWith(fontWeight: FontWeight.w500)),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorHelper.purple),
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(address,
                    style: TextStyleHelper.textStylefontSize14
                        .copyWith(color: ColorHelper.grey)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
