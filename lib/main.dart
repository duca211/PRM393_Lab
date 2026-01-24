import 'package:flutter/material.dart';
//import 'package:lab_exam/ui/pages/HomePage2.dart';
import 'package:lab_exam/ui/pages/About.dart';
import 'package:lab_exam/ui/pages/Products.dart';
import 'package:lab_exam/ui/pages/ProductListPage1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  Center bodyApp() => Center(child: Text("First App"));
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: ProductListPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
