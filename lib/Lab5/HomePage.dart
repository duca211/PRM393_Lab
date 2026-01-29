import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/Movie.dart';
import 'package:flutter_application_2/Lab5/MovieDetail.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: sampleMovies.length,
        itemBuilder: (context, index) {
          final movie = sampleMovies[index];
          return Card(
            elevation: 2,
            margin: EdgeInsets.only(bottom: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.all(10),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  movie.posterUrl,
                  width: 80,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                movie.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Text('⭐ ${movie.rating} • ${movie.genres.join(", ")}'),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetailScreen(movie: movie),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
