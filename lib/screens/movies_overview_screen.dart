import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/movies_grid.dart';
import '../widgets/badge.dart';
import '../providers/cart_provider.dart';
import './cart_screen.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyHomePage> {
  static int convertItemCount = 0;

  @override
  Widget build(BuildContext context) {
    Provider.of<CartProvider>(context).itemCount.then((value) {
      convertItemCount = value;
    });
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("CineCar Movies"),
        actions: <Widget>[
          Consumer<CartProvider>(
            builder: (_, cart, ch) => Badge(
              child: ch,
              value: convertItemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: MoviesGrid(),
    );
  }
}
