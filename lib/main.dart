import 'package:flutter/material.dart';
import 'package:frontend_app/providers/cart.dart';
import 'package:provider/provider.dart';

import './screens/cart_screen.dart';
import './screens/movies_overview_screen.dart';
import './screens/movie_detail_screen.dart';
import './providers/movies.dart';
import 'providers/cart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Movies(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
      ],
      child: MaterialApp(
          title: 'CineCar',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
          ),
          // home: new MyHomePage(),
          initialRoute: '/',
          routes: {
            '/': (ctx) => MyHomePage(),
            MovieDetailScreen.routeName: (ctx) => MovieDetailScreen(),
            CartScreen.routeName: (ctx) => CartScreen(),
          }),
    );
  }
}
