import 'package:flutter/cupertino.dart';
import 'package:movies_application/models/movie_model.dart';
import 'package:movies_application/screens/auth/firebase_service.dart';

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
  final firebaseService = FirebaseService();

  @override
  void initState() {
    super.initState();
    futureMovie = service.fetchMovies();
  }

  void handleClick(int item) {
    switch (item) {
      case 0:
        firebaseService.signOut();
        break;
      case 1:
        break;
    }
  }
}
