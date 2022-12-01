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
          Center(child: posterImage(imageUrl: state.movies.posterurl)),
          const SizedBox(height: 15),
          text(text: state.movies.title),
          const SizedBox(height: 8),
          Row(
            children: [
              text(
                text: state.movies.avrRating.toStringAsFixed(1),
                size: 20,
              ),
              const SizedBox(width: 8),
              ratingBar(state.movies.avrRating),
            ],
          ),
          const SizedBox(height: 8),
          text(text: 'Year: ${state.movies.year}', size: 20),
          const SizedBox(height: 8),
          text(text: 'Genres: ${state.movies.genres.join(', ').toString()}', size: 20),
          const SizedBox(height: 8),
          text(text: 'Duration: ${state.movies.durationMinutes}', size: 20),
        ],
      ),
    );
  }

}
