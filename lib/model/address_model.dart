class AddressModel {
  String? stateAddress;
  String? street;
  String? zipCode;
  String? city;
  // User user;
  AddressModel({
    required this.street,
    required this.city,
    required this.stateAddress,
    required this.zipCode,
    //required this.user
  });
  Map<String, dynamic> toMap() {
    return {
      'city': city,
      'street': street,
      'stateAddress': stateAddress,
      'zipCode': zipCode,
      // 'user': user,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      city: map['city'],
      street: map['street'],
      stateAddress: map['stateAddress'],
      zipCode: map['zipCode'],
      // user: map['user']
    );
  }
}
