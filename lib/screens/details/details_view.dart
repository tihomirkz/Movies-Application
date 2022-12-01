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
        child: text(text: state.movies.title),
      ),
    );
  }
}
