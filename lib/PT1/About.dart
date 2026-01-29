import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/Location.dart';
import 'package:flutter_application_2/PT1/LocationDetail.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: locs.length,
        itemBuilder: (context, index) {
          final location = locs[index];
          return ListTile(
            contentPadding: EdgeInsets.all(10),
            leading: Image.network(
              location.image,
              fit: BoxFit.cover,
              height: 150,
              width: 100,
            ),
            title: Text(
              location.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailLocation(location: location),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
