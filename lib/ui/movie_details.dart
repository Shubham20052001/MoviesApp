import 'package:flutter/material.dart';
import 'package:movies/model/movie_search_model.dart';

class MovieBackdrop extends StatelessWidget {
  final String? movieBackdropPath;

  const MovieBackdrop({Key? key, required this.movieBackdropPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(movieBackdropPath != null){
      return Container(
        child: Image(image: NetworkImage("https://image.tmdb.org/t/p/w500$movieBackdropPath")),
      );
    }else{
      return Container(
        child: Image(image: NetworkImage("https://via.placeholder.com/500x300?text=Image+not+available.")),
      );
    }
  }
}

class MovieDetailsText extends StatelessWidget {
  final Results movieObj;

  const MovieDetailsText({Key? key, required this.movieObj}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0,left: 5.0),
            child: Text("${movieObj.originalTitle}",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0,bottom: 8.0,right: 8.0,left: 12),
            child: Text("${movieObj.overview}",style: TextStyle(color: Colors.black45,fontSize: 18,fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }
}
