import 'package:flutter/material.dart';
import 'package:frontend_app/models/movie.dart';

class MovieDetailScreen extends StatelessWidget {
  static const routeName = '/movie-detail';

  @override
  Widget build(BuildContext context) {
    final movie = ModalRoute.of(context).settings.arguments as Movie;
    // ...
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.name),
      ),
    );
  }
}
