import 'package:flutter/material.dart';
import 'package:movies/model/movie_search_model.dart';
import 'package:movies/ui/movie_details.dart';

class MovieDetailsRoute extends StatelessWidget {
  final Results movie;

  const MovieDetailsRoute({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${movie.originalTitle}",style: TextStyle(color: Colors.black),),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MovieBackdrop(movieBackdropPath: movie.backdropPath),
            MovieDetailsText(movieObj: movie),
          ],
        ),
      ),
    );
  }
}
