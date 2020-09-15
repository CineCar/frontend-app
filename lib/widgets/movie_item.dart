import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/movie_detail_screen.dart';
import '../models/movie.dart';
import '../providers/cart_provider.dart';

class MovieItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final movie = Provider.of<Movie>(context);
    final cart = Provider.of<CartProvider>(context, listen: false);
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
        leading: new CircleAvatar(
          radius: 30.0,
          backgroundImage: NetworkImage(movie.imageUrl),
        ),
        onTap: () {
          Navigator.of(context)
              .pushNamed(MovieDetailScreen.routeName, arguments: movie);
        },
        trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {
              cart.addTicketToCartx(
                movie.movieScreenings[0].id,
              );
            }),
      ),
      new Divider(
        height: 2.0,
      ),
    ]);
  }
}
