import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/controller/search/search_state.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchStatus> {
  SearchCubit() : super(SearchInitial());
  List<Product> foundedProduct = [];
  List<Product> resultProductList = [];

  Future<void> getFirestoreDocuments() async {
    emit(SearchLoading());
    try {
      final data = await FirebaseFirestore.instance
          .collection('products')
          .orderBy('title')
          .get();
      foundedProduct =
          data.docs.map((doc) => Product.fromSnapshot(doc)).toList();
      emit(SearchLoaded(foundedProduct));
    } catch (e) {
      emit(SearchFailure(e.toString()));
    }
  }

  // Future<void> getTypeProduct(String typeProduct) async {
  //   emit(SearchLoading());
  //   try {
  //     final querySnapshot = await FirebaseFirestore.instance
  //         .collection('products')
  //         .where('type', isEqualTo: typeProduct)
  //         .get();

  //     foundedProduct =
  //         querySnapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
  //     emit(SearchLoaded(foundedProduct));
  //   } catch (e) {
  //     emit(SearchFailure(e.toString()));
  //   }
  // }

  void searchResultList(String query) {
    if (query.isEmpty) {
      resultProductList = List.from(foundedProduct);
    } else {
      resultProductList = foundedProduct
          .where((product) =>
              product.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    if (resultProductList.isNotEmpty) {
      emit(SearchSuccess(resultProductList));
    } else {
      emit(SearchFailure('No products found'));
    }
  }
}
