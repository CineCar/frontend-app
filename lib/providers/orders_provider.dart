import 'package:flutter/cupertino.dart';

import 'package:flutter/foundation.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<dynamic> tickets;
  final DateTime dateTime;

  OrderItem({
    this.id,
    this.amount,
    this.tickets,
    this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return _orders;
  }

  void addOrders(List<dynamic> cartTickets, double total) {
    _orders.insert(
        0,
        OrderItem(
          id: DateTime.now().toString(),
          amount: total,
          dateTime: DateTime.now(),
          tickets: cartTickets,
        ));
    notifyListeners();
  }
}
