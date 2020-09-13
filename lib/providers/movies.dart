import 'package:flutter/material.dart';
import 'dart:async';

import '../models/movie.dart';
import '../widgets/future.dart';

class Movies with ChangeNotifier {
  Future<List<Movie>> _movies = fetchMovie();

  Future<List<Movie>> get movies {
    return _movies;
  }

  Future<List<Movie>> get favoriteMovies {
    return _movies
        .then((value) => value.where((element) => element.isFavorite).toList());
  }

  void addMovie() {
    // _movies.add(value);
    notifyListeners();
  }
}
