import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lab_exam/models/Product.dart';
import 'package:lab_exam/services/GlobalStateService.dart';
import 'package:lab_exam/services/ProductListViewModel.dart';
import 'package:lab_exam/ui/widgets/CustomerWidget.dart';
import 'ProductFormScreen.dart';

class ProductListpage extends ConsumerWidget {
  const ProductListpage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logState = ref.watch(loginState);

    return Scaffold(
      appBar: AppBar(
        leading:
            //const Icon(Icons.menu),
            Category2Menu(),
        title: const Center(child: Text("Product List")),
        actions: [
          TextButton(
            onPressed: () {
              ref.read(loginState.notifier).state = !logState;
            },
            child: Text(logState ? "Logout" : "Login"),
          ),
        ],
      ),
      body: const ProductList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProductFormScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ProductList extends ConsumerWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(productListViewModelProvider);

    return productsAsync.when(
      data: (products) => ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) => ProductCart(product: products[index]),
      ),
      error: (err, stack) => Center(child: Text("Lỗi: $err")),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}

class ProductCart extends ConsumerWidget {
  final Product product;
  const ProductCart({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 160,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Image.asset(
                product.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.image_not_supported),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "Name: ",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: product.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      product.description,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "Price: \$${product.price}",
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Nút sửa
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProductFormScreen(product: product),
                              ),
                            );
                          },
                        ),
                        // Nút xóa
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.grey),
                          onPressed: () {
                            ref
                                .read(productListViewModelProvider.notifier)
                                .deleteProduct(product.id);
                          },
                        ),
                        // Nút yêu thích
                        IconButton(
                          icon: Icon(
                            product.isFavorite ? Icons.star : Icons.star_border,
                            color: product.isFavorite
                                ? Colors.red
                                : Colors.grey,
                          ),
                          onPressed: () {
                            final updatedProduct = product.copyWith(
                              isFavorite: !product.isFavorite,
                            );
                            ref
                                .read(productListViewModelProvider.notifier)
                                .updateProduct(updatedProduct);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
