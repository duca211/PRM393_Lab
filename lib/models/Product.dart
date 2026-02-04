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
  Product copyWith({
    String? id,
    String? name,
    int? price,
    String? description,
    String? imageUrl,
    bool? isFavorite,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  static List<Product> getList() {
    return [
      Product(
        id: "01",
        name: "Product 1",
        description:
            "Can't define a const constructor for a class with non-final fields. Try making all of the fields final, or removing the keyword 'const' from the constructor.",
        imageUrl: "assets/images/avatar7.jpg",
        price: 100,
        isFavorite: true,
      ),
      Product(
        id: "01",
        name: "Product 2",
        description:
            "Can't define a const constructor for a class with non-final fields. Try making all of the fields final, or removing the keyword 'const' from the constructor.",
        imageUrl: "assets/images/avatar7.jpg",
        price: 100,
        isFavorite: false,
      ),
      Product(
        id: "01",
        name: "Product 3",
        description:
            "Can't define a const constructor for a class with non-final fields. Try making all of the fields final, or removing the keyword 'const' from the constructor.",
        imageUrl: "assets/images/avatar7.jpg",
        price: 100,
        isFavorite: true,
      ),
      Product(
        id: "01",
        name: "Product 4",
        description:
            "Can't define a const constructor for a class with non-final fields. Try making all of the fields final, or removing the keyword 'const' from the constructor.",
        imageUrl: "assets/images/avatar7.jpg",
        price: 100,
        isFavorite: true,
      ),
      Product(
        id: "01",
        name: "Product 5",
        description:
            "Can't define a const constructor for a class with non-final fields. Try making all of the fields final, or removing the keyword 'const' from the constructor.",
        imageUrl: "assets/images/avatar7.jpg",
        price: 100,
        isFavorite: false,
      ),
    ];
  }
}
