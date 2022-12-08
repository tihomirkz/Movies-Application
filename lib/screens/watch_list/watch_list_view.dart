import 'package:flutter/material.dart';
import 'package:movies_application/models/movie_model.dart';
import 'package:movies_application/screens/home/widgets/movie_widgets.dart';
import 'package:movies_application/screens/watch_list/watch_list_page.dart';


class WatchListView extends StatelessWidget {
  final WatchListController state;

  const WatchListView(this.state, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watch list'),
      ),
      body: body(context),
    );
  }

  Widget body(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child:
      FutureBuilder<List<Movie>>(
        future: state.watchlistMovies,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Movie> movies = snapshot.data!;
            return ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return movieCard(
                    context: context,
                    movie: movies[index],
                    onPressedLikeButton: (Movie movie) {
                      state.setMovies(movies[index]);
                      state.setState(() {
                        state.getWatchMovies();
                      });
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

