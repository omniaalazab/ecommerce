import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class GetSpecificProduct {
//   static Query<Object?> getProduct({required String typeProduct}) {
//     final Query typeQuery = FirebaseFirestore.instance
//         .collection("products")
//         .where('type', isEqualTo: typeProduct);
//     return typeQuery;
//   }
// }
class SpecificProductStatus {}

class SpecificProductInitial extends SpecificProductStatus {}

class SpecificProductLoading extends SpecificProductStatus {}

class SpecificProductSuccess extends SpecificProductStatus {
  final List<Product> products;
  SpecificProductSuccess(this.products);
}

class SpecificProductFailure extends SpecificProductStatus {
  final String errorMessage;

  SpecificProductFailure(this.errorMessage);
}

class GetSpecificProductCubit extends Cubit<SpecificProductStatus> {
  GetSpecificProductCubit() : super(SpecificProductInitial());
  List<Product> foundedProduct = [];
  Future<void> getTypeProduct({required String typeProduct}) async {
    emit(SpecificProductLoading());
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('products')
          .where('type', isEqualTo: typeProduct)
          .get();

      foundedProduct =
          querySnapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
      emit(SpecificProductSuccess(foundedProduct));
    } catch (e) {
      emit(SpecificProductFailure(e.toString()));
    }
  }
}
