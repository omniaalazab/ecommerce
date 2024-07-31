import 'dart:developer';

import 'package:ecommerce/controller/address/address_cubit.dart';
import 'package:ecommerce/controller/address/address_state.dart';
import 'package:ecommerce/controller/order/order_cubit.dart';
import 'package:ecommerce/controller/payment/payment_cubit.dart';
import 'package:ecommerce/controller/payment/payment_state.dart';
import 'package:ecommerce/controller/send_mail_function.dart';

import 'package:ecommerce/helper/color_helper.dart';

import 'package:ecommerce/model/address_model.dart';
import 'package:ecommerce/model/payment_model.dart';
import 'package:ecommerce/views/ui/add_address.dart';

import 'package:ecommerce/views/ui/order_placed.dart';
import 'package:ecommerce/views/widget/shared_widget/calc_shipping_cost.dart';
import 'package:ecommerce/views/widget/shared_widget/custom_button.dart';
import 'package:ecommerce/views/widget/shared_widget/custom_title_pagerow.dart';
import 'package:ecommerce/views/widget/shared_widget/dialog_toast.dart';
import 'package:ecommerce/views/widget/shared_widget/list_tile_checkout.dart';
import 'package:ecommerce/views/widget/shared_widget/secured_card_payment.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class CheckOut extends StatefulWidget {
  CheckOut(
      {super.key,
      required this.totalPrice,
      required this.tax,
      required this.shippingCost,
      required this.numberOfOrderItems});

  int totalPrice;
  int shippingCost;
  int tax;
  int numberOfOrderItems;
  bool isMailSend = false;
  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  void initState() {
    context.read<AddressCubit>().fetchAddress();
    context.read<PaymentCubit>().fetchPaymentMethod();
    log("======");
    setState(() {});
    super.initState();
  }

  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //  backgroundColor: ColorHelper.darkpurple,
        body:
            BlocBuilder<AddressCubit, AddressState>(builder: (context, state) {
      return BlocBuilder<PaymentCubit, PaymentState>(
          builder: (context, paymentState) {
        final List<AddressModel> addressModel = state.addressModel;
        final List<PaymentModel> paymentModel = paymentState.paymentModel;

        return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              const SizedBox(
                height: 40,
              ),
              TitlePageRow(
                  pageTitle: "Checkout",
                  onPressedBackButton: () {
                    Navigator.pop(context);
                  }),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .45,
                child: Column(
                  children: [
                    ListTileCheckout(
                      titleListtile: "Shipping Address",
                      listTileColor: ColorHelper.lightPurple,
                      subTitleListtile: state.addressModel.isNotEmpty
                          ? ("${addressModel[addressModel.length - 1].street}, ${addressModel[addressModel.length - 1].city}, ${addressModel[addressModel.length - 1].stateAddress},${addressModel[addressModel.length - 1].zipCode}")
                          : "Add Address",
                      trailingOfCheckout: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => AddAddress(
                                          city: "",
                                          state: "",
                                          street: "",
                                        )));
                          },
                          icon: const Icon(Icons.arrow_forward_ios_rounded)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SecuredCardDisplay(
                      cardNumber: paymentState.paymentModel.isNotEmpty
                          ? (paymentModel[paymentModel.length - 1].cardNumber)
                          : "Add Payment Method",
                      cardTypeIcon: 'assets/images/Frame 30.png',
                    ),
                  ],
                ),
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height * .3,
                  child: Column(
                    children: [
                      CalcShippingCost(
                          titleDetailCost: "SubTotal",
                          price: "\$ ${widget.totalPrice}"),
                      CalcShippingCost(
                          titleDetailCost: "Shipping cost",
                          price: "${widget.shippingCost}"),
                      CalcShippingCost(
                          titleDetailCost: "Tax", price: "\$${widget.tax}"),
                      CalcShippingCost(
                          titleDetailCost: "Total",
                          price:
                              "\$${widget.shippingCost + widget.totalPrice + widget.tax}"),
                    ],
                  )),
              CustomElevatedButton(
                  buttonText2: "Place Order",
                  buttonText: "\$${widget.totalPrice}",
                  fontWeight: FontWeight.w500,
                  onPressedFunction: () {
                    if (state.addressModel.isNotEmpty &&
                        paymentState.paymentModel.isNotEmpty) {
                      widget.isMailSend = true;
                      EcommerceSendMail.sendMail(
                        toEmail: 'abdallahzidano176@gmail.com',
                        subject: 'Hello',
                        body: 'This is a sample email body.',
                      );

                      String orderId = OrderCubit.generateOrderId();
                      context.read<OrderCubit>().addToOrder(
                            orderId: orderId,
                            numberOfItems: widget.numberOfOrderItems,
                            deliveredDate: OrderCubit.getDeliveredDateTime(),
                            orderConfirmDate: OrderCubit.getNowDateTime(),
                            placedOrderDate: OrderCubit.getNowDateTime(),
                            shippingDate: OrderCubit.getNowDateTime(),
                          );
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => OrderPlaced(
                                  isMailSend: widget.isMailSend,
                                  address:
                                      "${addressModel[addressModel.length - 1].street}, ${addressModel[addressModel.length - 1].city}, ${addressModel[addressModel.length - 1].stateAddress},${addressModel[addressModel.length - 1].zipCode}",
                                  numberOfOrderItems:
                                      widget.numberOfOrderItems)));
                    } else {
                      CreateDialogToaster.showErrorDialogDefult("Warning",
                          "Please insert address and payment method");
                    }
                  },
                  backColor: ColorHelper.lightPurple,
                  fontColor: Colors.white)
            ]));
      });
    }));
  }
}
