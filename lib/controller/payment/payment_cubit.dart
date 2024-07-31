import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/controller/payment/payment_state.dart';
import 'package:ecommerce/model/payment_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentState(paymentModel: []));

  Future<void> updatePayment({
    required String cardNumber,
    String? cardHolderName,
    String? exp,
    String? cvv,
  }) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final paymentModel = PaymentModel(
        exp: exp,
        cardHolderName: cardHolderName,
        cardNumber: cardNumber,
        cvv: cvv,
      );
      await FirebaseFirestore.instance
          .collection('payment')
          .doc(user.email)
          .set(paymentModel.toMap(), SetOptions(merge: true));
      final currentAddress = List<PaymentModel>.from(state.paymentModel);
      currentAddress.add(paymentModel);
      emit(PaymentState(paymentModel: currentAddress));
    } else {
      throw Exception('No user is currently signed in.');
    }
  }

  Future<List<PaymentModel>> fetchPaymentMethod() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('payment').get();
    final paymentModel =
        snapshot.docs.map((doc1) => PaymentModel.fromMap(doc1.data())).toList();
    emit(PaymentState(paymentModel: paymentModel));
    return paymentModel;
  }
}
