import 'package:frontend_app/models/movie_screening.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import '../models/movie.dart';
import '../models/cart.dart';

final String url = 'api.ticketshop.mixify.ga';
final String protocol = 'https';

Future<dynamic> fetch(String requestMethod, String endPoint,
    [dynamic body]) async {
  var response;
  if (requestMethod == "GET") {
    response = await http.get('$protocol://$url/$endPoint');
  } else if (requestMethod == "POST") {
    response = await http.post('$protocol://$url/$endPoint',
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: json.encode(body));
  }

  if (response.statusCode == 200) {
    dynamic data = json.decode(response.body)['data'];

    return data;
  } else
    throw Exception('Failed to reach backend.');
}

Future<List<Movie>> getMovies() async {
  var data = await fetch('GET', 'movies') as List;
  List<Movie> movies = data.map((data) => Movie.fromJson(data)).toList();
  return movies;
}

Future<Cart> createCart() async {
  var data = await fetch('POST', 'carts') as Map;
  Cart cart = Cart.fromJson(data);
  return cart;
}

Future<dynamic> fetchCart(
    String requestMethod, String endPoint, movieScreeningId) async {
  var response;
  if (requestMethod == "GET") {
    response = await http.get('$protocol://$url/$endPoint');
  } else if (requestMethod == "POST") {
    response = await http.post('$protocol://$url/$endPoint',
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode({"movieScreeningId": movieScreeningId}));
  }

  if (response.statusCode == 200) {
    dynamic data = json.decode(response.body)['data'];

    return data;
  } else
    throw Exception('Failed to reach backend.');
}

Future<Cart> addTicketToCart(int cartId, int movieScreeningId) async {
  var data = await fetchCart('POST', 'carts/$cartId/tickets', movieScreeningId);
  Cart cart = Cart.fromJson(data);
  return cart;
}

Future<Movie> getMovie(int movieId) async {
  var data = await fetch('GET', 'movies/$movieId');
  var movie = Movie.fromJson(data);
  return movie;
}

Future<List<MovieScreening>> getMovieScreenings() async {
  var data = await fetch('GET', 'movie-screenings');
  List<MovieScreening> movieScreenings =
      data.map((data) => MovieScreening.fromJson(data)).toList();
  return movieScreenings;
}

Future<Cart> deleteTicketfromCart(int cartId, int ticketId) async {
  var data = await fetchDelete('/carts/$cartId/tickets/$ticketId');
  Cart cart = Cart.fromJson(data);
  return cart;
}

Future<dynamic> fetchDelete(String endPoint) async {
  var response;

  response = await http.delete('$protocol://$url/$endPoint');

  if (response.statusCode == 200) {
    dynamic data = json.decode(response.body)['data'];

    return data;
  } else
    throw Exception('Failed to reach backend.');
}

// Future<Booking> checkoutCart(int cartId) async {
//   var data = await fetch('POST', 'carts/$cartId/checkout', {});
//   Booking booking = Booking.fromJson(data);
//   return booking;
// }
