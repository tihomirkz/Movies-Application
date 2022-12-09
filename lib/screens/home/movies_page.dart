import 'package:flutter/material.dart';
import 'package:movies_application/models/movie_model.dart';
import 'package:movies_application/screens/auth/firebase_service.dart';
import 'package:movies_application/screens/user_profile/user_profile_page.dart';

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
    getMovies();
  }

  void handleClick(int item) {
    switch (item) {
      case 0:
        signOut();
        break;
      case 1:
        userProfilePage();
        break;
    }
  }

  Future getMovies() async {
    futureMovie = fetchMovies();
  }

  Future signOut() async {
    firebaseService.signOut();
  }

  void userProfilePage() {
    Navigator.push(context,
      MaterialPageRoute(
        builder: (context) =>  const UserProfilePage(),
      ),
    );
  }
}
