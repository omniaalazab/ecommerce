import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String? id;
  final String name;
  final String imageUrl;
  final int price;
  String? size;
  String? color;
  String? type;

  Product(
      {this.id,
      this.size,
      this.color,
      this.type,
      required this.name,
      required this.imageUrl,
      required this.price});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'price': price,
      'type': type,
    };
  }

  factory Product.fromSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Product(
      name: data['title'] ?? "",
      imageUrl: data['imageUrl'] ?? "",
      price: data['price'] ?? 0,
      type: data['type'] ?? "",
      // Initialize other fields from data
    );
  }
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      imageUrl: map['imageUrl'],
      price: map['price'],
      type: map['type'],
    );
  }
}
