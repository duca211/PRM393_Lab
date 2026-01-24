import 'dart:async';

class Product {
  final int id;
  final String name;
  final double price;

  Product({required this.id, required this.name, required this.price});

  @override
  String toString() => 'Product(id: $id, name: $name, price: $price)';
}

class ProductRepository {
  final List<Product> _products = [];
  final _controller = StreamController<Product>.broadcast();

  Future<List<Product>> getAll() async {
    await Future.delayed(Duration(seconds: 1));
    return _products;
  }

  Stream<Product> liveAdded() => _controller.stream;

  void addProduct(Product p) {
    _products.add(p);
    _controller.add(p);
  }
}

void main() async {
  print("Exercise 1");
  final repo = ProductRepository();

  repo.liveAdded().listen((product) {
    print("New product added in real-time: $product");
  });

  repo.addProduct(Product(id: 1, name: "Laptop", price: 1200));
  repo.addProduct(Product(id: 2, name: "Phone", price: 800));

  final all = await repo.getAll();
  print("All products: $all");
}
