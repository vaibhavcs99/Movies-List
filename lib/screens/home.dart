import 'dart:convert';
import 'package:movies_vcs/model/movie.dart';
import 'package:flutter/material.dart';
import 'package:movies_vcs/screens/movie_details.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Map<dynamic, dynamic>> movieList = Movie.getMovies();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movieList.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(radius: 30.0,
              child: Container(
                decoration: BoxDecoration(shape: BoxShape.circle,
                  image:DecorationImage(fit:BoxFit.cover ,image:NetworkImage(movieList[index]['Images'][0]))
                  ),
              ),
            ),
            trailing: Icon(Icons.ac_unit),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MovieDetails(name: "${movieList[index]['Title']}");
              }));
            },
            title: Text("${movieList[index]['Title']}"),
            subtitle: Text("${movieList[index]['Year']}"),
          ),
        );
      },
    );
  }
}
