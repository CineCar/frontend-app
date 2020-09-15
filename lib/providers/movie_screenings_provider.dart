import 'package:flutter/material.dart';
import 'dart:async';

import '../models/movie_screening.dart';
import '../widgets/REST_Connector.dart';

class MovieScreenings with ChangeNotifier {
  Future<List<MovieScreening>> _movieScreenings = getMovieScreenings();

  Future<List<MovieScreening>> get movieScreenings {
    return _movieScreenings;
  }

  void addMovie() {
    // _movies.add(value);
    notifyListeners();
  }
}
