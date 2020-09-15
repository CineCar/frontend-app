import 'package:flutter/material.dart';
import 'package:frontend_app/models/cart.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';
import '../widgets/cart_item.dart';
import '../providers/orders_provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Chip(
                    label: FutureBuilder<Cart>(
                        future: cartProvider.cart,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            var total = 0.0;
                            snapshot.data.tickets.forEach((ticket) {
                              total += ticket.movieScreening.movie.price;
                            });
                            return Text(
                              total.toString(),
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .primaryTextTheme
                                      .headline6
                                      .color),
                            );
                          } else {
                            return Text('---');
                          }
                        }),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  FutureBuilder<Cart>(
                      future: cartProvider.cart,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return FlatButton(
                            child: Text('Checkout'),
                            onPressed: () {
                              var total = 0.0;
                              snapshot.data.tickets.forEach((ticket) {
                                total += ticket.movieScreening.movie.price;
                              });
                              Provider.of<Orders>(context, listen: false)
                                  .addOrders(snapshot.data.tickets, total);
                              // cartProvider.checkoutCartx();
                            },
                            textColor: Theme.of(context).primaryColor,
                          );
                        } else {
                          return Text('---');
                        }
                      }),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: FutureBuilder<Cart>(
                future: cartProvider.cart,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data.tickets.length,
                      itemBuilder: (ctx, i) => TicketWidget(
                        snapshot.data.tickets.toList()[i].id,
                        snapshot.data.tickets.toList()[i].movieScreening,
                        snapshot.data.tickets.toList()[i].booking,
                      ),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
          ),
        ],
      ),
    );
  }
}
