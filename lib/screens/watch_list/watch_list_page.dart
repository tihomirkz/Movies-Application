import 'package:cloud_firestore/cloud_firestore.dart';
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

  final firebaseService = FirebaseService();

  Stream<QuerySnapshot<Map<String, dynamic>>> getStreamMovies() {
    return firebaseService.getStreamWatchMovies();
  }

  List<Movie> dataFromMovies(QuerySnapshot querySnapshot)  {
    return firebaseService.dataFromMovies(querySnapshot);
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
      });
      firebaseService.updateWatchList(movie);
    } else if (movie.isLiked) {
      setState(() {
        movie.isLiked = false;
      });
      firebaseService.updateWatchList(movie);
    }
  }
}