import 'package:ecommerce/controller/payment/payment_cubit.dart';
import 'package:ecommerce/controller/payment/payment_state.dart';
import 'package:ecommerce/helper/color_helper.dart';
import 'package:ecommerce/model/payment_model.dart';
import 'package:ecommerce/views/ui/add_payment_method.dart';
import 'package:ecommerce/views/widget/shared_widget/custom_title_pagerow.dart';
import 'package:ecommerce/views/widget/shared_widget/list_tile_checkout.dart';
import 'package:ecommerce/views/widget/shared_widget/secured_card_payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowPaymentInfo extends StatelessWidget {
  const ShowPaymentInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: ColorHelper.darkpurple,
      body: BlocBuilder<PaymentCubit, PaymentState>(
        builder: (context, paymentState) {
          final List<PaymentModel> paymentModel = paymentState.paymentModel;

          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(height: 40),
                TitlePageRow(
                  pageTitle: "Payment",
                  onPressedBackButton: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: 10),
                paymentModel.isNotEmpty
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height * .5,
                        child: ListView.builder(
                          itemCount: paymentModel.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: SecuredCardDisplay(
                                cardNumber: paymentModel[index].cardNumber,
                                cardTypeIcon:
                                    'assets/images/Frame 30.png', // Change this to your card type icon path
                              ),
                            );
                          },
                        ),
                      )
                    : ListTileCheckout(
                        titleListtile: "Payment Method",
                        subTitleListtile: "Add Payment Method",
                        listTileColor: ColorHelper.lightPurple,
                        trailingOfCheckout: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          const AddPaymentMethod()));
                            },
                            icon: const Icon(Icons.arrow_forward_ios_rounded)),
                      ),
                const SizedBox(
                  height: 20,
                ),
                ListTileCheckout(
                  titleListtile: "Paypal",
                  subTitleListtile: "Add Payment Method",
                  listTileColor: ColorHelper.lightPurple,
                  trailingOfCheckout: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const AddPaymentMethod()));
                      },
                      icon: const Icon(Icons.arrow_forward_ios_rounded)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
