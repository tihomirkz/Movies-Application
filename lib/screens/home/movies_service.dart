import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_application/models/movie_model.dart';
import 'package:movies_application/screens/auth/firebase_service.dart';

const baseUrl = 'https://raw.githubusercontent.com/FEND16/movie-json-data/master/json/movies-coming-soon.json';

class MoviesService {
  final firebaseService = FirebaseService();
  Future<List<Movie>> fetchMovies() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      final moviesList = jsonResponse.map((data) => Movie.fromJson(data)).toList();
      await firebaseService.setMoviesList(moviesList);
      final movieListFromFirebase = await firebaseService.getAllMovies();
      return movieListFromFirebase;
    } else {
      throw Exception('Failed to load album');
    }
  }
}
