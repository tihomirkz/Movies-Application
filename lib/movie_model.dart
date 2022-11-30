
class Movie {
  late List<String> actors;
  int averageRating = 0;
  String contentRating = '';
  String duration = '';
  late List<String> genres;
  String id = '';
  String imdbRating = '0';
  String originalTitle = '';
  String poster = '';
  String posterurl = '';
  late List<int> ratings;
  String releaseDate = '';
  String storyline = '';
  String title = '';
  String year = '';

  Movie();

  factory Movie.fromJson(Map<String, dynamic> json) {
    final movie = Movie();
    try {
      movie.actors = (json['actors'] as List<dynamic>).cast<String>();
      movie.averageRating = json['averageRating'];
      movie.contentRating = json['contentRating'];
      movie.duration = json['duration'];
      movie.genres = (json['genres'] as List<dynamic>).cast<String>();
      movie.id = json['id'];
      movie.imdbRating = json['imdbRating'].toString() ;
      movie.originalTitle = json['originalTitle'];
      movie.poster = json['poster'];
      movie.posterurl = json['posterurl'];
      movie.ratings = (json['ratings'] as List<dynamic>).map<int>((value) => value.toInt()).toList();
      movie.releaseDate = json['releaseDate'];
      movie.storyline = json['storyline'];
      movie.title = json['title'];
      movie.year = json['year'];

    } catch (exception) {
      print('PARSING ESTIMATE $exception');
    }

    return movie;
  }

}