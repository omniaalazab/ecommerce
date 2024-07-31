class Item {
  final String title;
  final String price;
  final String? originalPrice;
  final String imageUrl;

  Item({
    required this.title,
    required this.price,
    this.originalPrice,
    required this.imageUrl,
  });
}
