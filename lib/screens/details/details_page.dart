import 'package:flutter/cupertino.dart';
import 'package:movies_application/models/movie_model.dart';

import 'details_view.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({required this.movies, Key? key}) : super(key: key);
  final Movie movies;

  @override
  State<DetailsPage> createState() => DetailsController();
}

class DetailsController extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return DetailsView(this);
  }
}
