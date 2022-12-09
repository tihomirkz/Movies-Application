import 'package:flutter/material.dart';
import 'package:movies_application/models/movie_model.dart';
import 'package:movies_application/screens/auth/firebase_service.dart';
import 'package:movies_application/screens/details/details_page.dart';
import 'package:movies_application/screens/user_profile/user_profile_page.dart';
import 'package:movies_application/screens/watch_list/watch_list_page.dart';

import 'movies_service.dart';
import 'movies_view.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MoviesController();
}

class MoviesController extends State<MoviesPage> with MoviesService {
  @override
  Widget build(BuildContext context) => MoviesView(this);
  late Future<List<Movie>> futureMovie;
  final firebaseService = FirebaseService();

  @override
  void initState() {
    super.initState();
    _getMovies();
  }

  void handleClick(int item) {
    switch (item) {
      case 0:
        _signOut();
        break;
      case 1:
        _userProfilePage();
        break;
    }
  }

  Future _getMovies() async {
    futureMovie = fetchMovies();
  }

  Future _signOut() async {
    firebaseService.signOut();
  }

  void _userProfilePage() {
    Navigator.push(context,
      MaterialPageRoute(
        builder: (context) =>  const UserProfilePage(),
      ),
    );
  }

  Future<void> setMovies(Movie movie) async {
    if (!movie.isLiked) {
      setState(() {
        movie.isLiked = true;
      });
      firebaseService.setMovie(movie);
    } else if (movie.isLiked) {
      setState(() {
        movie.isLiked = false;
      });
      firebaseService.deleteMovie(movie);
    }
  }

  void onTapMovie(BuildContext context, Movie movie) {
    Navigator.push(context,
      MaterialPageRoute(
        builder: (context) => DetailsPage(movies: movie),
      ),
    );
  }

  void onTapWatchList(BuildContext context) {
    Navigator.push(context,
      MaterialPageRoute(
        builder: (context) => const WatchListPage(),
      ),
    );
  }
}
