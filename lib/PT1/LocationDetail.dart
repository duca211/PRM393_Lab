import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/Location.dart';
import 'package:flutter_application_2/PT1/About.dart';

class DetailLocation extends StatefulWidget {
  final Location location;
  DetailLocation({required this.location});

  @override
  _DetailLocationState createState() => _DetailLocationState();
}

class _DetailLocationState extends State<DetailLocation> {
  @override
  void initState() {
    super.initState();
    widget.location.star;
  }

  void _handleStarClick() {
    setState(() {
      widget.location.star++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter layout demo')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.network(
              widget.location.image,
              fit: BoxFit.cover,
              height: 250,
              width: double.infinity,
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.location.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.location.address,
                          style: TextStyle(color: Colors.grey[500]),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.star, color: Colors.red[500]),
                    onPressed: _handleStarClick,
                  ),
                  Text(widget.location.star.toString()),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(Icons.call, color: Colors.black),
                      Text('CALL', style: TextStyle(color: Colors.black)),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.near_me, color: Colors.black),
                      Text('ROUTE', style: TextStyle(color: Colors.black)),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.share, color: Colors.black),
                      Text('SHARE', style: TextStyle(color: Colors.black)),
                    ],
                  ),
                ],
              ),
            ),

            Text(
              widget.location.description,
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
