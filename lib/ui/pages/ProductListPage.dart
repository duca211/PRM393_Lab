import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lab_exam/models/Product.dart';
import 'package:lab_exam/services/GlobalStateService.dart';
import 'package:lab_exam/repository/ProductRepository.dart';

class ProductListpage extends ConsumerWidget {
  ProductListpage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    var logState = ref.watch(loginState);
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Center(child: Text("Product List")),
        actions: [
          TextButton(
            onPressed: () {
              ref.read(loginState.notifier).state = !logState;
            },
            child: Text(ref.watch(loginState) ? "Logout" : "Login"),
          ),
        ],
      ),
      body: ProductList(),
    );
  }
}

class ProductList extends ConsumerWidget {
  ProductList({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productProvider).value;
    // TODO: implement build
    // return ListView(
    //   children: [
    //     for (int i = 0; i < products.length; i++)
    //       ProductCart(product: products[i]),
    //   ],
    // );
    return ListView.builder(
      itemCount: products!.length,
      itemBuilder: (context, index) => ProductCart(product: products[index]),
    );
  }
}

class ProductCart extends StatefulWidget {
  Product product;
  ProductCart({super.key, required this.product});
  @override
  State<ProductCart> createState() => _ProductCartState(product: product);
}

class _ProductCartState extends State<ProductCart> {
  Product product;
  _ProductCartState({required this.product});
  changeState() {
    setState(() {
      product.isFavorite = !product.isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 190,
      child: Card(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Image.asset(product.imageUrl, width: 100, height: 100),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "Name: ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: product.name,
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Text("Name: ${product.name}"),
                    Text(product.description, textAlign: TextAlign.justify),
                    Text("Price: ${product.price}"),
                    IconButton(
                      onPressed: changeState,
                      icon: Icon(
                        Icons.star,
                        color: product.isFavorite ? Colors.red : Colors.grey,
                      ),
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
