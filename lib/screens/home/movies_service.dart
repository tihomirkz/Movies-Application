import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_application/models/movie_model.dart';
import 'package:movies_application/screens/auth/firebase_service.dart';
import 'package:movies_application/screens/auth/result.dart';

const baseUrl = 'https://raw.githubusercontent.com/FEND16/movie-json-data/master/json/movies-coming-soon.json';

class MoviesService {
  final firebaseService = FirebaseService();
  Future<Result<String, String>> fetchMovies() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      final moviesList = jsonResponse.map((data) => Movie.fromJson(data)).toList();
      await firebaseService.setMoviesList(moviesList);
      return const Result.success('Load data');
    } else {
      throw const Result.error('Failed to load data');
    }
  }
}
