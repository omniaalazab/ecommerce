import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/controller/address/address_state.dart';
import 'package:ecommerce/model/address_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit() : super(AddressState(addressModel: []));

  Future<void> updateAddress({
    String? street,
    String? city,
    String? stateAddress,
    String? zipCode,
  }) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final addressModel = AddressModel(
          city: city,
          stateAddress: stateAddress,
          // user: user,
          street: street,
          zipCode: zipCode);
      await FirebaseFirestore.instance
          .collection('address')
          .doc(user.email)
          .set(addressModel.toMap(), SetOptions(merge: true));
      final currentAddress = List<AddressModel>.from(state.addressModel);
      currentAddress.add(addressModel);
      emit(AddressState(addressModel: currentAddress));
    } else {
      throw Exception('No user is currently signed in.');
    }
  }

  Future<List<AddressModel>> fetchAddress() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('address').get();
    final addressModel =
        snapshot.docs.map((doc) => AddressModel.fromMap(doc.data())).toList();
    emit(AddressState(addressModel: addressModel));
    return addressModel;
  }

  void saveAddress({
    String? street,
    String? city,
    String? stateAddress,
    String? zipCode,
  }) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final addressModel = AddressModel(
          city: city,
          stateAddress: stateAddress,
          // user: user,
          street: street,
          zipCode: zipCode);
      try {
        await FirebaseFirestore.instance
            .collection('address')
            .doc(user.email)
            .set(addressModel.toMap());
        final currentAddress = List<AddressModel>.from(state.addressModel);
        currentAddress.add(addressModel);
        log('${currentAddress[0].street}');
        emit(AddressState(addressModel: currentAddress));
      } catch (e) {
        throw Exception('Failed to save address: $e');
      }
    } else {
      throw Exception('No user is currently signed in.');
    }
  }
}
