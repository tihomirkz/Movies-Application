import 'package:collection/collection.dart';

class Movie {
  late List<String> actors;
  int averageRating = 0;
  String contentRating = '';
  String duration = '';
  String durationMinutes = '';
  late List<String> genres;
  String id = '';
  String imdbRating = '0';
  String originalTitle = '';
  String poster = '';
  String posterurl = '';
  late List<int> ratings;
  double avrRating = 0;
  String releaseDate = '';
  String storyline = '';
  String title = '';
  String year = '';
  bool isLiked = false;

  Movie();

  factory Movie.fromJson(Map<String, dynamic> json) {
    final movie = Movie();
    try {
      movie.actors = (json['actors'] as List<dynamic>).cast<String>();
      movie.averageRating = json['averageRating'];
      movie.contentRating = json['contentRating'];
      movie.duration = json['duration'];
      movie.durationMinutes = movie.duration.isNotEmpty ? movie.duration.substring(2) : '0';
      movie.genres = (json['genres'] as List<dynamic>).cast<String>();
      movie.id = json['id'];
      movie.imdbRating = json['imdbRating'].toString() ;
      movie.originalTitle = json['originalTitle'];
      movie.poster = json['poster'];
      movie.posterurl = json['posterurl'];
      movie.ratings = (json['ratings'] as List<dynamic>).map<int>((value) => value.toInt()).toList();
      movie.avrRating = movie.ratings.average;
      movie.releaseDate = json['releaseDate'];
      movie.storyline = json['storyline'];
      movie.title = json['title'];
      movie.year = json['year'];
      movie.isLiked = json['isLiked'] ?? false;

    } catch (exception) {
      print('PARSING ESTIMATE $exception');
    }

    return movie;
  }


  Map<String, dynamic> toJson() {
    return {
      'actors': actors,
      'averageRating': averageRating,
      'contentRating': contentRating,
      'duration': duration,
      'durationMinutes': durationMinutes,
      'genres': genres,
      'id': id,
      'imdbRating': imdbRating,
      'originalTitle': originalTitle,
      'poster': poster,
      'posterurl': posterurl,
      'ratings': ratings,
      'avrRating': avrRating,
      'releaseDate': releaseDate,
      'storyline': storyline,
      'title': title,
      'year': year,
      'isLiked': isLiked,
    };
  }
}