class PaymentModel {
  String? cvv;
  String cardNumber;
  String? exp;
  String? cardHolderName;
  PaymentModel(
      {required this.cardNumber,
      required this.cardHolderName,
      required this.cvv,
      required this.exp});
  Map<String, dynamic> toMap() {
    return {
      'cardNumber': cardNumber,
      'cardHolderName': cardHolderName,
      'Exp': exp,
      'cvv': cvv,
      // 'user': user,
    };
  }

  factory PaymentModel.fromMap(Map<String, dynamic> map) {
    return PaymentModel(
      cardNumber: map['cardNumber'],
      cardHolderName: map['cardHolderName'],
      exp: map['Exp'],
      cvv: map['cvv'],
      // user: map['user']
    );
  }
}
