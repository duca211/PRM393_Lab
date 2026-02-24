class Product {
  final String id;
  final String caId; // Thêm trường ID danh mục
  final String name;
  final int price;
  final String description;
  final String imageUrl;
  bool isFavorite;

  Product({
    required this.id,
    required this.caId, // Thêm vào constructor
    required this.name,
    this.price = 0,
    this.description = "",
    this.imageUrl = "",
    this.isFavorite = true,
  });

  Product copyWith({
    String? id,
    String? caId, // Thêm vào copyWith
    String? name,
    int? price,
    String? description,
    String? imageUrl,
    bool? isFavorite,
  }) {
    return Product(
      id: id ?? this.id,
      caId: caId ?? this.caId, // Gán giá trị mới hoặc giữ nguyên giá trị cũ
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
        caId: "ca01", // Ví dụ gán cho Category 1
        name: "Product 1",
        description: "Mô tả sản phẩm 1",
        imageUrl: "assets/images/avatar7.jpg",
        price: 100,
        isFavorite: true,
      ),
      Product(
        id: "02",
        caId: "ca01",
        name: "Product 2",
        description: "Mô tả sản phẩm 2",
        imageUrl: "assets/images/avatar7.jpg",
        price: 100,
        isFavorite: false,
      ),
      Product(
        id: "03",
        caId: "ca02", // Ví dụ gán cho Category 2
        name: "Product 3",
        description: "Mô tả sản phẩm 3",
        imageUrl: "assets/images/avatar7.jpg",
        price: 100,
        isFavorite: true,
      ),
      Product(
        id: "04",
        caId: "ca03", // Ví dụ gán cho Category 3
        name: "Product 4",
        description: "Mô tả sản phẩm 4",
        imageUrl: "assets/images/avatar7.jpg",
        price: 100,
        isFavorite: true,
      ),
      Product(
        id: "05",
        caId: "ca04", // Ví dụ gán cho Category 4
        name: "Product 5",
        description: "Mô tả sản phẩm 5",
        imageUrl: "assets/images/avatar7.jpg",
        price: 100,
        isFavorite: false,
      ),
    ];
  }
}
