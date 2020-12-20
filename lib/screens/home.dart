
import 'package:google_fonts/google_fonts.dart';
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
      itemBuilder: (BuildContext context, int tindex) {
        return myCard(tindex);
      },
    );
  }

  Widget myCard(int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: Stack(
          overflow: Overflow.visible,
          alignment: AlignmentDirectional.centerEnd,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MovieDetails(index:index);
                }));
              },
              child: Card(
                  elevation: 5.0,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.80,
                    height: 90.0,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 48.0, top: 16.0, bottom: 8.0),
                                  child: Text("${movieList[index]['Title']}",
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(fontSize: 18)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 48.0),
                                  child: Text(
                                    "${movieList[index]['Genre']}",
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.w200,
                                            fontStyle: FontStyle.italic)),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(children: [
                            Padding(
                                padding: const EdgeInsets.only(
                                    right: 8.0, top: 19.0),
                                child: Text(
                                  'ImDB',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                )),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('${movieList[index]['imdbRating']}'),
                            )
                          ])
                        ]),
                  )),
            ),
            Positioned(
              left: -10,
              child: CircleAvatar(
                radius: 40.0,
                backgroundImage: NetworkImage(movieList[index]['Images'][2]),
              ),
            ),
          ]),
    );
  }
}
