import 'package:flutter/material.dart';
import 'package:frontend_app/models/booking.dart';
import 'package:frontend_app/models/movie_screening.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';

class TicketWidget extends StatelessWidget {
  final int id;
  final MovieScreening movieScreening;
  final Booking booking;

  TicketWidget(
    this.id,
    this.movieScreening,
    this.booking,
  );

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
          color: Theme.of(context).errorColor,
          child: Icon(
            Icons.delete,
            color: Colors.white,
            size: 40,
          ),
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 20),
          margin: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 4,
          )),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<CartProvider>(context, listen: false)
            .deleteTicketFromCartx(id);
      },
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: new CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(movieScreening.movie.imageUrl),
            ),
            title: Text(movieScreening.movie.name),
            subtitle: Text('Price: ' + movieScreening.movie.price.toString()),
          ),
        ),
      ),
    );
  }
}
