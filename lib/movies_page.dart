import 'package:flutter/cupertino.dart';

import 'movies_view.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MoviesController();
}

class MoviesController extends State<MoviesPage> {
  @override
  Widget build(BuildContext context) => MoviesView(this);
}


