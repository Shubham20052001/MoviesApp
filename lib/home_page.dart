import 'package:flutter/material.dart';
import 'package:movies/model/movie_search_model.dart';
import 'package:movies/network/network.dart';
import 'package:movies/ui/movie_cards.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<MovieSearchModel> movieObject;
  String _movieName = "Avatar";

  @override
  void initState() {
    super.initState();

    movieObject = Network().getMovies(movieName: _movieName);
    // movieObject.then((value) => value.results![0].id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Movies App",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade600,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue, Colors.yellow.shade600])),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: textFieldView(),
            ),
            Container(
              child: FutureBuilder(
                  future: movieObject,
                  builder: (BuildContext context,AsyncSnapshot<MovieSearchModel> snapshot){
                if(snapshot.hasData){
                  return Column(
                    children: [
                      movieCards(snapshot,context),
                    ],
                  );
                }else{
                  return Container(
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
              }),
            )
          ],
        ),
      ),
    );
  }

  Widget textFieldView() {
    return Container(
      child: TextField(
        decoration: InputDecoration(
            hintText: "Enter movie name",
            prefixIcon: Icon(Icons.search),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10)),contentPadding: EdgeInsets.all(8)),
        showCursor: true,
        onSubmitted: (value){
            setState(() {
              _movieName = value;
              _movieName = _movieName.trim();
              if(_movieName.isNotEmpty) movieObject = Network().getMovies(movieName: _movieName);
            });
        },
      ),
    );
  }
}
