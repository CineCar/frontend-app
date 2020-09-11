import 'package:flutter/material.dart';

import '../models/movie.dart';
import '../widgets/future.dart';

class Movies with ChangeNotifier {
  Future<List<Movie>> _movies = fetchMovie();

  Future<List<Movie>> get movies {
    return _movies;
  }

  void addMovie() {
    // _movies.add(value);
    notifyListeners();
  }
}
