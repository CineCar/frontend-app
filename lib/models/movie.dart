import 'package:flutter/foundation.dart';
import 'movie_screening.dart';

class Movie with ChangeNotifier {
  final int id;
  final String name;
  final int duration;
  final double price;
  final String imageUrl;
  final List<dynamic> movieScreenings;

  Movie({
    this.id,
    this.name,
    this.duration,
    this.price,
    this.imageUrl,
    this.movieScreenings,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    if (!json.containsKey("movieScreenings")) {
      return Movie(
          id: json['id'],
          name: json['name'],
          duration: json['duration'],
          price: json['price'].toDouble(),
          imageUrl: json['imageUrl'],
          movieScreenings: []);
    } else {
      return Movie(
          id: json['id'],
          name: json['name'],
          duration: json['duration'],
          price: json['price'].toDouble(),
          imageUrl: json['imageUrl'],
          movieScreenings: List<MovieScreening>.from(
              json["movieScreenings"].map((x) => MovieScreening.fromJson(x))));
    }
  }
}
