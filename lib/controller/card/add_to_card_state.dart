import 'package:ecommerce/model/card_model.dart';

// class AddToCardStatus {}

// class CardInitial extends AddToCardStatus {}

// class CardSuccess extends AddToCardStatus {
//    final List<CartItem> cartItems;

//   CardSuccess({required this.cartItems});
// }

// class CardFailure extends AddToCardStatus {
//   final String errorMessage;

//   CardFailure(this.errorMessage);
// }
class CartState {
  final List<CartItem> cartItems;

  CartState({required this.cartItems});
}
