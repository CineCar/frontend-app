import 'movie_screenings.dart';

class Movie {
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
    return Movie(
      id: json['id'],
      name: json['name'],
      duration: json['duration'],
      price: json['price'].toDouble(),
      imageUrl: json['imageUrl'],
      movieScreenings: json['movieScreenings']
          .map((data) => MovieScreenings.fromJson(data))
          .toList(),
    );
  }
}
