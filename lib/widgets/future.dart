import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import '../models/movie.dart';

final String url = 'api.ticketshop.mixify.ga';
final String protocol = 'https';

// Future<dynamic> fetch(String requestMethod, String endPoint,
//     [dynamic body]) async {
//       var response;
//   if (requestMethod == "GET") {
//     response = await http.get('$protocol://$url/$endPoint');
//   } else if (requestMethod == "POST") {
//     response = await http.post('$protocol://$url/$endPoint', body: body);
//   }

//   if(response.statusCode == 200){

//     dynamic data = json.decode(response.body)['data'];

//     return data;

//   } else throw Exception('Failed to reach backend.')

// }

Future<List<Movie>> fetchMovie() async {
  final response = await http.get('$protocol://$url/movies');

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
