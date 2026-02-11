//1. Khai bao package
import 'package:lab_exam/models/Product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//2. Khai bao ten tep dart ma nguon duoc riverpod
part 'ProductRepository.g.dart';

//3. Khai bao annotation riverpod de sinh ra
// productRepositoryProvider trong ProviderScope
@riverpod
ProductRepository productRepository(ProductRepositoryRef ref) =>
    ProductRepository();

final productProvider = FutureProvider<List<Product>>(
  (ref) => ProductRepository().getAll(),
);

class ProductRepository {
  ProductRepository();
  var products = Product.getList();
  Future<List<Product>> getAll() async {
    //code doc du lieu tu api hoac database
    //return Product.getList();
    return products;
  }

  Future<void> add(Product p) async {
    products.add(p);
  }

  Future<void> edit(Product p) async {
    int index = products.indexWhere((element) => element.id == p.id);
    if (index != -1) {
      products[index] = p;
    }
  }

  Future<void> delete(String id) async {
    products.removeWhere((p) => p.id == id);
  }
}
