import 'package:flutter/material.dart';
import 'package:movies_application/models/movie_model.dart';
import 'package:movies_application/screens/auth/firebase_service.dart';
import 'package:movies_application/screens/details/details_page.dart';
import 'package:movies_application/screens/watch_list/watch_list_view.dart';

class WatchListPage extends StatefulWidget {
  const WatchListPage({Key? key}) : super(key: key);

  @override
  State<WatchListPage> createState() => WatchListController();
}

class WatchListController extends State<WatchListPage> {
  @override
  Widget build(BuildContext context) => WatchListView(this);

  late Future<List<Movie>> watchlistMovies;
  final firebaseService = FirebaseService();

  @override
  void initState() {
    super.initState();
    getWatchMovies();
  }

  Future<void> getWatchMovies() async {
    watchlistMovies = firebaseService.getMovies();
  }

  void onTapMovie(BuildContext context, Movie movie) {
    Navigator.push(context,
      MaterialPageRoute(
        builder: (context) => DetailsPage(movies: movie),
      ),
    );
  }

  Future<void> setMovies(Movie movie) async {
    if (!movie.isLiked) {
      setState(() {
        movie.isLiked = true;
        getWatchMovies();
      });
      firebaseService.setMovie(movie);
    } else if (movie.isLiked) {
      setState(() {
        movie.isLiked = false;
        getWatchMovies();
      });
      firebaseService.deleteMovie(movie);
    }
  }
}