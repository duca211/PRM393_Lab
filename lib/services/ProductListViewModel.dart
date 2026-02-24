import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/Product.dart';
import '../repository/ProductRepository.dart';

part 'ProductListViewModel.g.dart';

@riverpod
class ProductListViewModel extends _$ProductListViewModel {
  String? _caId;
  @override
  FutureOr<List<Product>> build() async {
    //return ref.watch(productRepositoryProvider).getAll();
    final allProducts = await ref.read(productRepositoryProvider).getAll();
    if (_caId == null || _caId!.isEmpty) {
      return allProducts;
    } else {
      return allProducts.where((element) => element.caId == _caId).toList();
    }
  }

  Future<void> FillByCategory(String caId) async {
    _caId = caId;
    ref.invalidateSelf();
  }

  //chuc nang them
  Future<void> addProduct(Product p) async {
    state = const AsyncLoading();
    await ref.read(productRepositoryProvider).add(p);
    ref.invalidateSelf();
  }

  //chuc nang xoa
  Future<void> deleteProduct(String id) async {
    state = const AsyncLoading();
    await ref.read(productRepositoryProvider).delete(id);
    ref.invalidateSelf();
  }

  //chuc nang update
  Future<void> updateProduct(Product p) async {
    state = const AsyncLoading();
    await ref.read(productRepositoryProvider).edit(p);
    ref.invalidateSelf();
  }
}
