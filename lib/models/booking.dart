import 'ticket.dart';
import 'person.dart';

class Booking {
  final int id;
  final List<dynamic> tickets;
  final Person person;
  bool cancelled;

  Booking({
    this.id,
    this.tickets,
    this.person,
    this.cancelled,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'],
      tickets: json['tickets'].map((data) => Ticket.fromJson(data)).toList(),
      person: Person.fromJson(json['person']),
      cancelled: json['cancelled'],
    );
  }

  void toggleCancelledStatus() {
    cancelled = !cancelled;
  }
}
