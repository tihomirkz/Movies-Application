import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        body: Container()
    );
  }
}
