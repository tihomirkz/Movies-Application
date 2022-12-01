import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movies_application/models/movie_model.dart';
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
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(Radius.circular(8.0),
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: movies[index].posterurl,
                                    placeholder: (context, url) => const CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                      const Image(image: AssetImage('assets/images/no_poster.jpg')),
                                  ),
                                ),
                              ),
                              Text(movies[index].title,
                                style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                ),
                              ),
                              const SizedBox(height: 8),
                              RatingBarIndicator(
                                rating: movies[index].avrRating,
                                itemCount: 10,
                                itemSize: 25.0,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                movies[index].avrRating.toStringAsFixed(1),
                                style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
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
