import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_application/models/movie_model.dart';

const baseUrl = 'https://raw.githubusercontent.com/FEND16/movie-json-data/master/json/movies-coming-soon.json';

class MoviesService {
  Future<List<Movie>> fetchMovies() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Movie.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }
}
