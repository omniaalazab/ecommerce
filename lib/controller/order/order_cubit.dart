import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/controller/order/order_state.dart';
import 'package:ecommerce/model/order_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

class OrderCubit extends Cubit<OrderState> {
  //final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  OrderCubit() : super(OrderState(orderModel: []));
  Future<void> addToOrder({
    required String orderId,
    required int numberOfItems,
    required String deliveredDate,
    required String orderConfirmDate,
    required String placedOrderDate,
    required String shippingDate,
  }) async {
    final orderModel = OrderModel(
        deliveredDate: deliveredDate,
        numberOfItems: numberOfItems,
        orderConfirmDate: orderConfirmDate,
        orderId: orderId,
        placedOrderDate: placedOrderDate,
        shippingDate: shippingDate);
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await FirebaseFirestore.instance
          .collection('order')
          .doc(user.email)
          .set(orderModel.toMap());
      final currentCartItems = List<OrderModel>.from(state.orderModel);
      currentCartItems.add(orderModel);
      emit(OrderState(orderModel: currentCartItems));
    }
  }

  static String getNowDateTime() {
    int month = DateTime.now().month;
    int day = DateTime.now().day;
    String date = "$day / $month";
    return date;
  }

  static String getDeliveredDateTime() {
    int month = DateTime.now().month;
    int day = DateTime.now().add(const Duration(days: 1)).day;
    String date = "$day / $month";
    return date;
  }

  static String generateOrderId() {
    return const Uuid()
        .v4(); // You need to add the 'uuid' package in your pubspec.yaml
  }

  Future<void> fetchCartItems() async {
    final snapshot = await FirebaseFirestore.instance.collection('carts').get();
    final curremtOrder =
        snapshot.docs.map((doc) => OrderModel.fromMap(doc.data())).toList();
    emit(OrderState(orderModel: curremtOrder));
  }
}
