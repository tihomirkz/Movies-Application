import 'package:flutter/material.dart';
import 'package:movies_application/screens/home/movies_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MoviesPage(),
    );
  }
}

