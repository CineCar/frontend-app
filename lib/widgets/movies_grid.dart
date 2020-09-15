import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/movie.dart';
import './movie_item.dart';
import '../providers/movies_provider.dart';

class MoviesGrid extends StatelessWidget {
  MoviesGrid();

  @override
  Widget build(BuildContext context) {
    final moviesData = Provider.of<Movies>(context);
    final movies = moviesData.movies;
    return FutureBuilder<List<Movie>>(
      future: movies,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              padding: const EdgeInsets.all(10.0),
              itemCount: snapshot.data.length,
              itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                    value: snapshot.data[i],
                    child: MovieItem(),
                  ));
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
  }
}
