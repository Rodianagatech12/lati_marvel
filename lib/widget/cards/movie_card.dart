import 'package:flutter/material.dart';
import 'package:lati_marvel/models/movie_model.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(movie.coverUrl),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(movie.title),
          ),
        ],
      ),
    );
  }
}
