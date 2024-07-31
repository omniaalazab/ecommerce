class OrderModel {
  String orderId;
  int numberOfItems;
  String shippingDate;
  String deliveredDate;
  String placedOrderDate;
  String orderConfirmDate;
  OrderModel({
    required this.orderId,
    required this.numberOfItems,
    required this.deliveredDate,
    required this.orderConfirmDate,
    required this.placedOrderDate,
    required this.shippingDate,
  });
  Map<String, dynamic> toMap() {
    return {
      'orderId': orderId,
      'numberOfItems': numberOfItems,
      'deliveredDate': deliveredDate,
      'orderConfirmDate': orderConfirmDate,
      'placedOrderDate': placedOrderDate,
      'shippingDate': shippingDate,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      orderId: map['orderId'],
      numberOfItems: map['numberOfItems'],
      deliveredDate: map['deliveredDate'],
      orderConfirmDate: map['orderConfirmDate'],
      placedOrderDate: map['placedOrderDate'],
      shippingDate: map['shippingDate'],
    );
  }
}
