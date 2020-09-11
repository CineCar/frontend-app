import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/movie.dart';
import './movie_item.dart';
import '../providers/movies.dart';

class MoviesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moviesData = Provider.of<Movies>(context);
    return FutureBuilder<List<Movie>>(
      future: moviesData.movies,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            padding: const EdgeInsets.all(10.0),
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int i) =>
                MovieItem(snapshot.data[i]),
            // itemBuilder: (BuildContext context, int i) => MovieItem(
            //   snapshot.data[i].id,
            //   snapshot.data[i].name,
            //   snapshot.data[i].duration,
            // ),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
  }
}
