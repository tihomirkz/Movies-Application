import 'package:flutter/cupertino.dart';

import '../../models/movie_model.dart';
import 'movies_service.dart';
import 'movies_view.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MoviesController();
}

class MoviesController extends State<MoviesPage> {
  @override
  Widget build(BuildContext context) => MoviesView(this);
  late Future<List<Movie>> futureMovie;
  final service = MoviesService();

  @override
  void initState() {
    super.initState();
    futureMovie = service.fetchMovies();
  }
}


