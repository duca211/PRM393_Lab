import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/Model.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;
  MovieDetailScreen({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  movie.posterUrl,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.8),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Text(
                    movie.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.all(16),
              child: Wrap(
                spacing: 10,
                children: movie.genres
                    .map((g) => Chip(label: Text(g)))
                    .toList(),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                movie.overview,
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildActionButton(Icons.favorite_border, 'Favorite'),
                  _buildActionButton(Icons.star_border, 'Rate'),
                  _buildActionButton(Icons.share, 'Share'),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Trailers',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: movie.trailers.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.play_circle_fill),
                  title: Text(movie.trailers[index].title),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Column(
      children: [Icon(icon, size: 28), SizedBox(height: 5), Text(label)],
    );
  }
}
