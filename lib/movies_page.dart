import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'movie_model.dart';
import 'movies_view.dart';
import 'package:http/http.dart' as http;

class MoviesPage extends StatefulWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MoviesController();
}

class MoviesController extends State<MoviesPage> {
  @override
  Widget build(BuildContext context) => MoviesView(this);
  late Future<List<Movie>> futureMovie;

  @override
  void initState() {
    super.initState();
    futureMovie = fetchMovies();
  }

  Future<List<Movie>> fetchMovies() async {
    final response = await http.get(Uri.parse('https://raw.githubusercontent.com/FEND16/movie-json-data/master/json/movies-coming-soon.json'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Movie.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

}


