import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movies_application/models/movie_model.dart';
import 'package:movies_application/screens/home/widgets/movie_widgets.dart';
import 'movies_page.dart';

class MoviesView extends StatelessWidget {
  final MoviesController state;

  const MoviesView(this.state, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies Application'),
        actions: <Widget>[
          IconButton(
            onPressed: () => state.onTapWatchList(context),
            icon: const Icon(
              Icons.favorite,
              color: Colors.white,
            ),
          ),
          PopupMenuButton<int>(
            icon: const Icon(Icons.menu),
            onSelected: (item) => state.handleClick(item),
            itemBuilder: (context) => [
              const PopupMenuItem<int>(value: 0, child: Text('Logout')),
              const PopupMenuItem<int>(value: 1, child: Text('User profile')),
            ],
          ),
        ],
      ),
      body: body(context),
    );
  }

  Widget body(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: StreamBuilder<QuerySnapshot>(
        stream:  state.getStreamMovies(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final moviesList = state.dataFromMovies(snapshot.data!);
            return ListView.builder(
              itemCount: moviesList.length,
              itemBuilder: (context, index) {
                return  movieCard(
                    context: context,
                    movie: moviesList[index],
                    onPressedLikeButton: (Movie movie) {
                      state.setMovies(moviesList[index]);
                    },
                    onTapMovie: (BuildContext context, Movie movie) {
                      state.onTapMovie(context, movie);
                    }
                );
              },
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error.toString()}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator(color: Colors.white,));
        },
      ),
    );
  }
}
