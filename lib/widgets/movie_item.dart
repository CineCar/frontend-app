import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/movie_detail_screen.dart';
import '../models/movie.dart';
import '../providers/cart.dart';

class MovieItem extends StatelessWidget {
  // final Movie movie;

  // const MovieItem(this.movie);

  @override
  Widget build(BuildContext context) {
    final movie = Provider.of<Movie>(context);
    final cart = Provider.of<Cart>(context, listen: false);
    return new Column(children: <Widget>[
      new ListTile(
        title: new Text(
          movie.name,
          textAlign: TextAlign.center,
        ),
        subtitle: new Text(
          'Running time: ' + movie.duration.toString(),
          textAlign: TextAlign.center,
        ),
        // leading: new CircleAvatar(
        //   radius: 30.0,
        //   backgroundImage: NetworkImage(movie.imageUrl),
        // ),
        leading: IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {
              cart.addItem(movie.id.toString(), movie.price, movie.name);
            }),
        onTap: () {
          Navigator.of(context)
              .pushNamed(MovieDetailScreen.routeName, arguments: movie);
        },
        trailing: IconButton(
          icon: Icon(movie.isFavorite ? Icons.favorite : Icons.favorite_border),
          onPressed: () {
            movie.toggleFavoriteStatus();
          },
        ),
      ),
      new Divider(
        height: 2.0,
      ),
    ]);
  }
}
