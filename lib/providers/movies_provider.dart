import 'package:flutter/material.dart';
import 'dart:async';

import '../models/movie.dart';
import '../widgets/REST_Connector.dart';

class Movies with ChangeNotifier {
  Future<List<Movie>> _movies = getMovies();

  Future<List<Movie>> get movies {
    return _movies;
  }

  void addMovie() {
    // _movies.add(value);
    notifyListeners();
  }
}
