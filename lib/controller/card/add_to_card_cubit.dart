import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/controller/card/add_to_card_state.dart';
import 'package:ecommerce/model/card_model.dart';
import 'package:ecommerce/model/product_model.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class CardCubit extends Cubit<CartState> {
  //final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  CardCubit() : super(CartState(cartItems: []));
  Future<void> addToCart(
      Product product, String size, String color, int quantity) async {
    final cartItem = CartItem(
        id: product.id!,
        product: product,
        color: color,
        size: size,
        quantity: quantity);
    await FirebaseFirestore.instance
        .collection('carts')
        .doc(product.name)
        .set(cartItem.toMap());
    final currentCartItems = List<CartItem>.from(state.cartItems);
    currentCartItems.add(cartItem);
    emit(CartState(cartItems: currentCartItems));
  }

  Future<void> fetchCartItems() async {
    final snapshot = await FirebaseFirestore.instance.collection('carts').get();
    final cartItems =
        snapshot.docs.map((doc) => CartItem.fromMap(doc.data())).toList();
    emit(CartState(cartItems: cartItems));
  }

  Future<void> removeFromCart(String id) async {
    await FirebaseFirestore.instance.collection('carts').doc(id).delete();
    final currentCartItems =
        state.cartItems.where((item) => item.id != id).toList();
    emit(CartState(cartItems: currentCartItems));
  }
}
