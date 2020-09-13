import 'package:flutter/foundation.dart';

import 'movie_screening.dart';

class Movie with ChangeNotifier {
  final int id;
  final String name;
  final int duration;
  final double price;
  final String imageUrl;
  final List<dynamic> movieScreenings;
  bool isFavorite;

  Movie({
    this.id,
    this.name,
    this.duration,
    this.price,
    this.imageUrl,
    this.movieScreenings,
    this.isFavorite = false,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      name: json['name'],
      duration: json['duration'],
      price: json['price'].toDouble(),
      imageUrl: json['imageUrl'],
      movieScreenings: json['movieScreenings']
          .map((data) => MovieScreening.fromJson(data))
          .toList(),
    );
  }

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
