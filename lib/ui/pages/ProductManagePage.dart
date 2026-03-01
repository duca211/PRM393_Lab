import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lab_exam/models/Category.dart';
import 'package:lab_exam/models/Product.dart';
import 'package:lab_exam/services/GlobalStateService.dart';
import 'package:lab_exam/services/ProductListViewModel.dart';
import 'package:lab_exam/ui/widgets/CustomerWidget.dart';
import 'ProductFormScreen.dart';

class InputWidget extends ConsumerWidget {
  const InputWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //lay ve danh sach cac category
    //code lai theo riverpod provider giong products
    final categories = CategoryProduct.getCategories();
    final _formKey = GlobalKey<FormState>();
    String _proId = "";
    String _catId = "";
    final _proNameController = TextEditingController();
    String _proName = "";
    String _proPrice = "";
    String _proDescription = "";
    // TODO: implement build
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(hintText: 'Enter Product id'),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Product id is required';
              }
              return null;
            },
            //cach 1: lay gia tri cua cac dieu khien trong cac su kien
            onChanged: (value) {
              _proId = value;
            },
          ),
          DropdownButtonFormField(
            decoration: const InputDecoration(
              hintText: 'Select Product category',
            ),
            items: categories
                .map(
                  (CategoryProduct category) => DropdownMenuItem(
                    value: category.caId,
                    child: Text(category.caName),
                  ),
                )
                .toList(),
            onChanged: (value) {
              _catId = value!;
            },
          ),
          TextFormField(
            controller: _proNameController,
            decoration: const InputDecoration(hintText: 'Enter Product name'),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Product name is required';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(hintText: 'Enter Product price'),
            //1. Hien thi ban phim so
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ],
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Product price is required';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter Product description',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Product description is required';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState!.validate()) {
                  // Add product
                  Product p = Product(
                    id: _proId,
                    caId: _catId,
                    name: _proNameController.text,
                  );
                  ref.read(productListViewModelProvider.notifier).addProduct(p);
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductListpage extends ConsumerWidget {
  const ProductListpage({super.key});
  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Product'),
          content: const SingleChildScrollView(child: InputWidget()),
          actions: <Widget>[
            TextButton(
              child: const Text('Submit'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

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
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => const ProductFormScreen()),
          // );
          _showMyDialog(context);
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

class ProductListGridViewResponsive extends ConsumerWidget {
  const ProductListGridViewResponsive({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productListViewModelProvider).value ?? [];
    int _numOfColumns(BuildContext context) {
      if (MediaQuery.of(context).size.width >= 1200) {
        return 4; // Desktop
      } else if (MediaQuery.of(context).size.width >= 800) {
        return 3; // Tablet
      } else {
        return 1; // Mobile
      }
    }

    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: _numOfColumns(context),
      children: products
          .map((product) => ProductCart(product: product))
          .toList(),
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
