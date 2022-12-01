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
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        margin: const EdgeInsets.all(8),
                        elevation: 5,
                        color: Colors.black12,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: posterImage(imageUrl: movies[index].posterurl),
                              ),
                              text(text: movies[index].title),
                              const SizedBox(height: 8,),
                              ratingBar(movies[index].avrRating),
                              const SizedBox(height: 8,),
                              text(
                                text: 'Rating: ${movies[index].avrRating.toStringAsFixed(1)}',
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      );
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
}
