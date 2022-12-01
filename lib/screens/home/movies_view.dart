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
      ),
      body: Container(
        color: Colors.blueGrey,
        child: FutureBuilder<List<Movie>>(
          future: state.futureMovie,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Movie> movies = snapshot.data!;
              return ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return movieCard(context, movies[index]);
                },
              );
            }
            if (snapshot.hasError) {
              print(snapshot.error.toString());
              return const Text('error');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Widget movieCard(BuildContext context, Movie movie) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: const EdgeInsets.all(8),
      elevation: 5,
      color: Colors.black12,
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: posterImage(imageUrl: movie.posterurl),
              ),
              text(text: movie.title),
              const SizedBox(height: 8),
              ratingBar(movie.avrRating),
              const SizedBox(height: 8),
              text(
                text: 'Rating: ${movie.avrRating.toStringAsFixed(1)}',
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
