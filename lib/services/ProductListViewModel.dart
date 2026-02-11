import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/Product.dart';
import '../repository/ProductRepository.dart';

part 'ProductListViewModel.g.dart';

@riverpod
class ProductListViewModel extends _$ProductListViewModel {
  @override
  FutureOr<List<Product>> build() async {
    return ref.watch(productRepositoryProvider).getAll();
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
