class Product {
  final String id;
  final String name;
  final int price;
  final String description;
  final String imageUrl;
  bool isFavorite;
  Product({
    required this.id,
    required this.name,
    this.price = 0,
    this.description = "",
    this.imageUrl = "",
    this.isFavorite = true,
  });
  // void copyWith({
  //   String? id,
  //   String? name,
  //   int? price,
  //   String? description,
  //   String? imnageUrl,
  //   bool? isFavorite,
  // })
}
