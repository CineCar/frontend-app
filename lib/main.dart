import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import './screens/movies_overview_screen.dart';
import './screens/movie_detail_screen.dart';
import './providers/movies.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Movies(),
      child: MaterialApp(
          title: 'CineCar',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
          ),
          home: new MyHomePage(),
          routes: {
            MovieDetailScreen.routeName: (ctx) => MovieDetailScreen(),
          }),
    );
  }
}
