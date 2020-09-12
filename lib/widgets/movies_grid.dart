import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/movie.dart';
import './movie_item.dart';
import '../providers/movies.dart';

class MoviesGrid extends StatelessWidget {
  final bool showFavs;

  MoviesGrid(this.showFavs);

  @override
  Widget build(BuildContext context) {
    final moviesData = Provider.of<Movies>(context);
    final movies = showFavs ? moviesData.favoriteMovies : moviesData.movies;
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

// itemBuilder: (BuildContext context, int i) =>
//     MovieItem(snapshot.data[i]),

// itemBuilder: (BuildContext context, int i) => MovieItem(
//   snapshot.data[i].id,
//   snapshot.data[i].name,
//   snapshot.data[i].duration,
// ),
