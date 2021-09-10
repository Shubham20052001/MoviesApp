import 'package:flutter/material.dart';
import 'package:movies/model/movie_search_model.dart';
import 'package:movies/ui/movie_detalis_route.dart';

Widget movieCards(
    AsyncSnapshot<MovieSearchModel> snapshot, BuildContext context) {
  var moviesList = snapshot.data!.results;

  return GridView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      scrollDirection: Axis.vertical,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 130,
          mainAxisExtent: 130,
          // childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemCount: moviesList!.length,
      itemBuilder: (context, index) {
        var moviePosterPath = moviesList[index].posterPath;
        var moviePoster;
        if (moviePosterPath != null) {
          moviePoster = "https://image.tmdb.org/t/p/w500$moviePosterPath";
          return InkWell(
            child: Card(
                elevation: 20,
                child: Column(
                  children: [
                    Expanded(
                        child: Container(
                            child: Image.network(
                      moviePoster ?? "https://via.placeholder.com/100",
                      fit: BoxFit.cover,
                    ))),
                    Text(moviesList[index].originalTitle ?? "No Data"),
                  ],
                )
                // clipBehavior: Clip.antiAlias,
                ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MovieDetailsRoute(movie: moviesList[index])));
            },
          );
        } else {
          return InkWell(
            child: Card(
              elevation: 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(moviesList[index].originalTitle ?? "No Data"),
                ],
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MovieDetailsRoute(movie: moviesList[index])));
            },
          );
        }
      });
}
