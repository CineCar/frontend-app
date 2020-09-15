import 'package:flutter/material.dart';

import 'ticket.dart';

class Cart {
  final int id;
  final String creationDate;
  final List<dynamic> tickets;

  Cart({
    @required this.id,
    this.creationDate,
    this.tickets,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      id: json['id'],
      creationDate: json['creationDate'],
      tickets: json['tickets'].map((data) => Ticket.fromJson(data)).toList(),
    );
  }
}
