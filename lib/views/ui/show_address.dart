import 'package:ecommerce/controller/address/address_cubit.dart';
import 'package:ecommerce/controller/address/address_state.dart';
import 'package:ecommerce/helper/color_helper.dart';
import 'package:ecommerce/model/address_model.dart';
import 'package:ecommerce/views/ui/add_address.dart';
import 'package:ecommerce/views/widget/shared_widget/custom_title_pagerow.dart';
import 'package:ecommerce/views/widget/shared_widget/list_tile_checkout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowAddressInfo extends StatelessWidget {
  const ShowAddressInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: ColorHelper.darkpurple,
        body:
            BlocBuilder<AddressCubit, AddressState>(builder: (context, state) {
      final List<AddressModel> addressModel = state.addressModel;

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
                  ListTileCheckout(
                    titleListtile: "Shipping Address",
                    subTitleListtile: state.addressModel.isNotEmpty
                        ? ("${addressModel[addressModel.length - 1].street}, ${addressModel[addressModel.length - 1].city}, ${addressModel[addressModel.length - 1].stateAddress},${addressModel[addressModel.length - 1].zipCode}")
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
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ]));
    }));
  }
}
