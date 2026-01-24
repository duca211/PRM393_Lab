import 'package:flutter/material.dart';
import 'package:lab_exam/models/Product.dart';
import 'package:lab_exam/ui/pages/About.dart';

class ProductListPage extends StatelessWidget {
  List<Product> products = [
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
  ProductListPage({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          leading: Icon(Icons.menu),
          title: Center(child: Text("Product List")),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutPage()),
                );
                //Navigator.push( context, MaterialPageRoute(builder: (context) => Widget()), ); chuyen trang
              },
              icon: Icon(
                Icons.account_circle,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.amber,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.navigate_next),
              label: "Next",
            ),
          ],
        ),
        body: ProductList(),
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  List<Product> products = [
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
  ProductList({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // return ListView(
    //   children: [
    //     for (int i = 0; i < products.length; i++)
    //       ProductCart(product: products[i]),
    //   ],
    // );
    return ListView.builder(
      itemCount: products.length,
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
