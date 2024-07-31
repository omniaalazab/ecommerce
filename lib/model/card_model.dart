import 'package:ecommerce/model/product_model.dart';

class CartItem {
  final String id;
  final Product product;
  final int quantity;
  String size;
  String color;
  CartItem(
      {required this.id,
      required this.product,
      required this.quantity,
      required this.size,
      required this.color});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'product': product.toMap(),
      'quantity': quantity,
    };
  }

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      id: map['id'],
      product: Product.fromMap(map['product']),
      quantity: map['quantity'],
      color: map['color'],
      size: map['color'],
    );
  }
}
