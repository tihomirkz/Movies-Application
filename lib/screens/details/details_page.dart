import 'package:flutter/cupertino.dart';
import 'package:movies_application/models/movie_model.dart';

import 'details_view.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => DetailsController();
}

class DetailsController extends State<DetailsPage> {
  late Movie movies;

  @override
  Widget build(BuildContext context) {
    movies = ModalRoute.of(context)!.settings.arguments as Movie;
    return DetailsView(this);
  }
}
