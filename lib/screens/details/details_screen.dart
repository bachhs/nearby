import 'package:flutter/material.dart';
import 'package:nearby/models/movie.dart';
import 'package:nearby/screens/details/components/body.dart';

class DetailsScreen extends StatelessWidget {
  final Movie movie;
  const DetailsScreen({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Body(movie: movie),
    );
  }
}
