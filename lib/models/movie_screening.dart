import '../models/movie.dart';

class MovieScreening {
  final int id;
  final DateTime datetime;
  final Movie movie;

  MovieScreening({this.id, this.datetime, this.movie});

  factory MovieScreening.fromJson(Map<String, dynamic> json) {
    if (json['movie'] != null) {
      return MovieScreening(
          id: json['id'],
          datetime: DateTime.parse(json['datetime']),
          movie: Movie.fromJson(
            json['movie'],
          ));
    } else {
      return MovieScreening(
        id: json['id'],
        datetime: DateTime.parse(json['datetime']),
        movie: null,
      );
    }
  }
}
