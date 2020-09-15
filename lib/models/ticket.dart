import 'movie_screening.dart';
import 'booking.dart';

class Ticket {
  final int id;
  final MovieScreening movieScreening;
  final Booking booking;

  Ticket({
    this.id,
    this.movieScreening,
    this.booking,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) {
    Booking booking;
    if (json['booking'] != null) {
      booking = Booking.fromJson(json['booking']);
    }
    return Ticket(
      id: json['id'],
      movieScreening: MovieScreening.fromJson(json['movieScreening']),
      booking: booking,
    );
  }
}
