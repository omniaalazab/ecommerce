import 'package:ecommerce/controller/payment/payment_cubit.dart';
import 'package:ecommerce/controller/validatio_function.dart/validation_function.dart';
import 'package:ecommerce/helper/color_helper.dart';

import 'package:ecommerce/views/widget/shared_widget/custom_button.dart';
import 'package:ecommerce/views/widget/shared_widget/custom_title_pagerow.dart';
import 'package:ecommerce/views/widget/shared_widget/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPaymentMethod extends StatefulWidget {
  const AddPaymentMethod({super.key});

  @override
  State<AddPaymentMethod> createState() => _AddPaymentMethodState();
}

class _AddPaymentMethodState extends State<AddPaymentMethod> {
  TextEditingController addCardNumberController = TextEditingController();

  TextEditingController addCardHolderNaneController = TextEditingController();

  TextEditingController addCCvController = TextEditingController();

  TextEditingController addEXpController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: ColorHelper.darkpurple,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              TitlePageRow(
                  pageTitle: "Add Payment  Method",
                  onPressedBackButton: () {
                    Navigator.pop(context);
                  }),
              const SizedBox(
                height: 30,
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ColorHelper.purple),
                      height: 70,
                      child: CustomAllTextField(
                          labelText: "Card Number",
                          textFieldController: addCardNumberController,
                          // onSavedFunction: (value) =>
                          //     paymentCubit.updatePayment(cardNumber: value),
                          validatorFunction: (value) {
                            if (value!.length != 14) {
                              return "Not Valid";
                            }
                            CheckEmptyValidationTextField.checkIsEmpty(value);
                            return null;
                          }),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ColorHelper.purple),
                      height: 70,
                      child: CustomAllTextField(
                          labelText: "Card Holder Name ",
                          textFieldController: addCardHolderNaneController,
                          // onSavedFunction: (value) =>
                          //     paymentCubit.updatePayment(cardNumber: value),
                          validatorFunction: (value) {
                            CheckEmptyValidationTextField.checkIsEmpty(value);
                            return null;
                          }),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorHelper.purple),
                          height: 70,
                          width: MediaQuery.of(context).size.width * .45,
                          child: CustomAllTextField(
                              labelText: "CCV ",
                              textFieldController: addCCvController,
                              // onSavedFunction: (value) =>
                              //     paymentCubit.updatePayment(ccv: value),
                              validatorFunction: (value) {
                                if (value!.length != 3) {
                                  return "Not Valid";
                                }
                                CheckEmptyValidationTextField.checkIsEmpty(
                                    value);
                                return null;
                              }),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorHelper.purple),
                          height: 70,
                          width: MediaQuery.of(context).size.width * .40,
                          child: CustomAllTextField(
                              labelText: "Exp ",
                              textFieldController: addEXpController,
                              // onSavedFunction: (value) =>
                              //     paymentCubit.updatePayment(expiryDate: value),
                              validatorFunction: (value) {
                                if (value!.length != 5) {
                                  return "Not Valid";
                                }
                                CheckEmptyValidationTextField.checkIsEmpty(
                                    value);
                                return null;
                              }),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 350,
              ),
              CustomElevatedButton(
                  alignButton: MainAxisAlignment.center,
                  buttonText: "Save",
                  fontWeight: FontWeight.w500,
                  onPressedFunction: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      context.read<PaymentCubit>().updatePayment(
                          exp: addEXpController.text,
                          cardHolderName: addCardHolderNaneController.text,
                          cardNumber: addCardNumberController.text,
                          cvv: addCCvController.text);
                      Navigator.pop(context);
                      setState(() {});
                    }
                  },
                  backColor: ColorHelper.lightPurple,
                  fontColor: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
