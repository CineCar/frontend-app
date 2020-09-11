import 'dart:async';
import 'package:flutter/material.dart';

import '../models/movie.dart';
import '../widgets/future.dart';
import '../screens/movie_detail_screen.dart';
import '../widgets/movies_grid.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyHomePage> {
  // Future<List<Movie>> futureMovie;

  // @override
  // void initState() {
  //   super.initState();
  //   futureMovie = fetchMovie();
  // }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("CineCar Movies"),
      ),
      body: MoviesGrid(),
    );
  }
}
