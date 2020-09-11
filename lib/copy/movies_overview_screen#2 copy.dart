import 'dart:async';
import 'package:flutter/material.dart';

import '../models/movie.dart';
import '../widgets/movie_item.dart';
import '../widgets/future.dart';
import 'movie_detail_screen.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyHomePage> {
  Future<List<Movie>> futureMovie;

  @override
  void initState() {
    super.initState();
    futureMovie = fetchMovie();
  }

  @override
  Widget build(BuildContext context) {
    var futureBuilder = new FutureBuilder<List<Movie>>(
      future: futureMovie,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return createListView(context, snapshot);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("CineCar Movies"),
      ),
      body: futureBuilder,
    );
  }

  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
    List<Movie> values = snapshot.data;
    return new ListView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: values.length,
      itemBuilder: (BuildContext context, int i) => MovieItem(
        values[i].id,
        values[i].name,
        values[i].duration,
      ),
    );
  }
}
