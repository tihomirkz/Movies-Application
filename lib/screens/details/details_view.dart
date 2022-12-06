import 'package:flutter/material.dart';
import 'package:movies_application/screens/home/widgets/movie_widgets.dart';

import 'details_page.dart';

class DetailsView extends StatelessWidget {
  const DetailsView(this.state, {Key? key}) : super(key: key);
  final DetailsController state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Detail movie'),
      ),
      body: SingleChildScrollView(
        child: detailsMovie(),
      ),
    );
  }

  Widget detailsMovie() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: posterImage(imageUrl: state.widget.movies.posterurl)),
          const SizedBox(height: 15),
          text(text: state.widget.movies.title),
          const SizedBox(height: 8),
          Row(
            children: [
              text(
                text: state.widget.movies.avrRating.toStringAsFixed(1),
                size: 20,
              ),
              const SizedBox(width: 8),
              ratingBar(state.widget.movies.avrRating),
            ],
          ),
          const SizedBox(height: 8),
          text(text: 'Year: ${state.widget.movies.year}', size: 20),
          const SizedBox(height: 8),
          text(text: 'Genres: ${state.widget.movies.genres.join(', ').toString()}', size: 20),
          const SizedBox(height: 8),
          text(text: 'Duration: ${state.widget.movies.durationMinutes}', size: 20),
          const SizedBox(height: 8),
          text(text: 'Release Date: ${state.widget.movies.releaseDate}', size: 20),
          const SizedBox(height: 8),
          text(text: 'Actors: ${state.widget.movies.actors.join(', ').toString()}', size: 20),
          const SizedBox(height: 8),
          text(text: 'Storyline: ${state.widget.movies.storyline}', size: 20),
        ],
      ),
    );
  }

}
