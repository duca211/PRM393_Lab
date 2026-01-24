import 'package:flutter/material.dart';
import 'package:lab_exam/ui/pages/About.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          leading: Icon(Icons.menu),
          title: Center(child: Text("About me")),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.home))],
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
  const ProductList({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Column(
        children: [
          AboutContent(),
          AboutContent(),
          AboutContent(),
          AboutContent(),
        ],
      ),
    );
  }
}

class RowProduct extends StatelessWidget {
  const RowProduct({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: [
        Expanded(flex: 1, child: AboutContent()),
        Expanded(flex: 2, child: AboutContent()),
      ],
    );
  }
}
