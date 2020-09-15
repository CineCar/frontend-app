import 'package:flutter/foundation.dart';

import '../widgets/REST_Connector.dart';

import '../models/cart.dart';

class CartProvider with ChangeNotifier {
  Future<Cart> _cart = createCart();

  Future<Cart> get cart {
    return _cart;
  }

  Future<int> get itemCount async {
    var syncCart = await cart;
    return syncCart.tickets.length + 1;
  }

  Future<double> get totalAmount async {
    var syncCart = await cart;
    var total = 0.0;
    syncCart.tickets.forEach((ticket) {
      total += ticket.movieScreening.movie.price;
    });
    return total;
  }

  void addTicketToCartx(
    int movieScreeningId,
  ) async {
    var syncCart = await cart;

    _cart = addTicketToCart(syncCart.id, movieScreeningId);
    notifyListeners();
  }

  void deleteTicketFromCartx(int ticketId) async {
    var syncCart = await cart;

    _cart = deleteTicketfromCart(syncCart.id, ticketId);
    notifyListeners();
  }

  // void checkoutCartx() async {
  //   var syncCart = await cart;

  //   checkoutCart(syncCart.id);
  //   notifyListeners();
  // }
}
