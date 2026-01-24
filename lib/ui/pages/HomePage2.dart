import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"), backgroundColor: Colors.amber),
      body: const MyColumn(),
    );
  }
}

class BackGround1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue,
        ),
      ),
    );
  }
}

class BackGround2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.fromLTRB(100, 100, 100, 100),
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(75),
          color: Colors.green,
        ),
      ),
    );
  }
}

class MyStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      alignment: Alignment.center,
      children: [BackGround1(), BackGround2()],
    );
  }
}

class MyColumn extends StatelessWidget {
  const MyColumn({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: [MyRow(), MyRow(), MyStack()]);
  }
}

class MyRow extends StatelessWidget {
  const MyRow({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MyContainer(content: "Content 1"),
        MyContainer(content: "Content 2"),
        MyContainer(content: "Content 3"),
      ],
    );
  }
}

class MyContainer extends StatelessWidget {
  final String content;
  const MyContainer({this.content = "", super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 100,
        height: 100,
        alignment: Alignment.center,
        child: Text(this.content),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.purple, width: 3),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
