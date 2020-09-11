import 'package:flutter/material.dart';
import 'package:frontend_app/models/movie.dart';

import '../screens/movie_detail_screen.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;

  const MovieItem(this.movie);

  @override
  Widget build(BuildContext context) {
    return new Column(children: <Widget>[
      new ListTile(
        title: new Text(
          movie.name,
          textAlign: TextAlign.center,
        ),
        subtitle: new Text(
          'Running time: ' +
              movie.duration.toString() +
              ' Price: ' +
              movie.price.toString(),
          textAlign: TextAlign.center,
        ),
        onTap: () {
          Navigator.of(context)
              .pushNamed(MovieDetailScreen.routeName, arguments: movie);
        },
        leading: IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {},
        ),
      ),
      // ),
      new Divider(
        height: 2.0,
      ),
    ]);
  }
}
