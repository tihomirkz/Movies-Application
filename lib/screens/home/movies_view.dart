import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
                                    errorWidget: (context, url, error) => const Icon(Icons.error),
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
                              const SizedBox(height: 5,),
                              Text(
                                movies[index].avrRating,
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
