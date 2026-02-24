import 'package:flutter/material.dart';

class CategoryProduct {
  final String caId;
  final String caName;
  final Icon icon;
  CategoryProduct({
    required this.caId,
    required this.icon,
    required this.caName,
  });

  static List<CategoryProduct> getCategories() {
    return [
      CategoryProduct(
        caId: "ca01",
        icon: Icon(Icons.home),
        caName: "Category 1",
      ),
      CategoryProduct(
        caId: "ca02",
        icon: Icon(Icons.home),
        caName: "Category 2",
      ),
      CategoryProduct(
        caId: "ca03",
        icon: Icon(Icons.home),
        caName: "Category 3",
      ),
      CategoryProduct(
        caId: "ca04",
        icon: Icon(Icons.home),
        caName: "Category 4",
      ),
    ];
  }
}
