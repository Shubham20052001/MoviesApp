import 'dart:convert';
import 'package:http/http.dart';
import 'package:movies/model/movie_search_model.dart';
import 'package:movies/util/util.dart';

class Network {
  Future<MovieSearchModel> getMovies({required String movieName}) async {
    String finalUrl = "https://api.themoviedb.org/3/search/movie?api_key="+Util.appId+"&query="+movieName;

    finalUrl = Uri.encodeFull(finalUrl);
    var finalUri = Uri.parse(finalUrl);
    final response = await get(finalUri);

    if(response.statusCode == 200){
      return MovieSearchModel.fromJson(json.decode(response.body)); // We get actual mapped objects (Dart Objects)
    }else{
      throw Exception("Error getting movies");
    }
  }
}