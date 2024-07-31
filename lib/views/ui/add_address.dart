import 'package:ecommerce/controller/address/address_cubit.dart';
import 'package:ecommerce/controller/validatio_function.dart/validation_function.dart';
import 'package:ecommerce/helper/color_helper.dart';

import 'package:ecommerce/views/widget/shared_widget/custom_button.dart';
import 'package:ecommerce/views/widget/shared_widget/custom_title_pagerow.dart';
import 'package:ecommerce/views/widget/shared_widget/text_form_field.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class AddAddress extends StatelessWidget {
  AddAddress({
    required this.street,
    required this.city,
    required this.state,
    super.key,
  });
  String city;
  String street;
  String state;

  TextEditingController addStreetController = TextEditingController();

  TextEditingController addCityController = TextEditingController();

  TextEditingController addStateController = TextEditingController();

  TextEditingController addCodeController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final addressCubit = context.read<AddressCubit>();

    return Scaffold(
      // backgroundColor: ColorHelper.darkpurple,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              TitlePageRow(
                  pageTitle: "Add Address",
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
                          labelText: "Street Address",
                          textFieldController: addStreetController,

                          // addressCubit.updateAddress(
                          //   street: value,
                          // ),
                          validatorFunction: (value) {
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
                          labelText: "City ",
                          textFieldController: addCityController,

                          // addressCubit.updateAddress(city: value),
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
                              labelText: "State ",
                              textFieldController: addStateController,

                              //  addressCubit .updateAddress(stateAddress: value),
                              validatorFunction: (value) {
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
                          width: MediaQuery.of(context).size.width * .43,
                          child: CustomAllTextField(
                              labelText: "Zip Code ",
                              textFieldController: addCodeController,

                              // addressCubit.updateAddress(zipCode: value),
                              validatorFunction: (value) {
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
                      addressCubit.updateAddress(
                        street: addStreetController.text,
                        city: addCityController.text,
                        stateAddress: addStateController.text,
                        zipCode: addCodeController.text,
                      );
                      Navigator.pop(context);
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
