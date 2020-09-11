import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String name;
  final int quantity;
  final double price;

  CartItem({
    @required this.id,
    @required this.name,
    @required this.quantity,
    @required this.price,
  });
}

class Cart {
  Map<String, CartItem> _movies;

  Map<String, CartItem> get movies {
    return {..._movies};
  }

  void addItem(
    String movieId,
    double price,
    String name,
  ) {
    if (_movies.containsKey(movieId)) {
      _movies.update(
          movieId,
          (existingCartItem) => CartItem(
                id: existingCartItem.id,
                name: existingCartItem.name,
                price: existingCartItem.price,
                quantity: existingCartItem.quantity + 1,
              ));
    } else {
      _movies.putIfAbsent(
        movieId,
        () => CartItem(
          id: DateTime.now().toString(),
          name: name,
          price: price,
          quantity: 1,
        ),
      );
    }
  }
}
