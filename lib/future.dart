import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import './models/movie.dart';

Future<List<Movie>> fetchMovie() async {
  final response = await http.get('https://api.ticketshop.mixify.ga/movies');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(response.body);

    List<dynamic> data = json.decode(response.body)['data'];
    List<Movie> movies = data.map((data) => Movie.fromJson(data)).toList();

    return movies;
    // return Movie.fromJson(json.decode(response.body)['data']);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load movie');
  }
}
