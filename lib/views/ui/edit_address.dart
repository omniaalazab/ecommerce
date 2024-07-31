import 'package:ecommerce/controller/address/address_cubit.dart';
import 'package:ecommerce/controller/address/address_state.dart';
import 'package:ecommerce/helper/color_helper.dart';

import 'package:ecommerce/views/ui/add_address.dart';
import 'package:ecommerce/views/widget/shared_widget/custom_title_pagerow.dart';
import 'package:ecommerce/views/widget/shared_widget/list_tile_checkout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditAddress extends StatelessWidget {
  const EditAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: ColorHelper.darkpurple,
        body:
            BlocBuilder<AddressCubit, AddressState>(builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          const SizedBox(
            height: 40,
          ),
          TitlePageRow(
              pageTitle: "Address",
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
                ListView.builder(
                  itemCount: state.addressModel.length,
                  itemBuilder: (context, index) {
                    final addressModel = state.addressModel[index];

                    return ListTileCheckout(
                      titleListtile: "Shipping Address",
                      subTitleListtile: state.addressModel.isNotEmpty
                          ? ("${addressModel.street}, ${addressModel.city}, ${addressModel.stateAddress}${addressModel.zipCode}")
                          : "Add Address",
                      listTileColor: ColorHelper.lightPurple,
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
                    );
                  },
                )
              ],
            ),
          )
        ]),
      );
    }));
  }
}
