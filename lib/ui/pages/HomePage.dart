import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "First App", home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text("Home"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(child: Text("Hello World")),
    );
  }
}
