import 'movie.dart';

class MovieScreenings {
  final int id;
  final DateTime date;

  MovieScreenings({this.id, this.date});

  factory MovieScreenings.fromJson(Map<String, dynamic> json) {
    return MovieScreenings(
      id: json['id'],
      date: json['date'],
    );
  }
}
