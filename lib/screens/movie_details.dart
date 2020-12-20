import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_vcs/model/movie.dart';

import 'favorite.dart';

class MovieDetails extends StatefulWidget {
  final int index;
  const MovieDetails({
    Key key,
    this.index,
  }) : super(key: key);

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  final List<Map<dynamic, dynamic>> movieList = Movie.getMovies();

  @override
  Widget build(BuildContext context) {
    int index = widget.index;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.favorite),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return Favourite(index);
                },
              ),
            );
          }),
      appBar: AppBar(
        title: Text("${movieList[index]['Title']}"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          topImage(index),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: movieYearGenre(index),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: movieName(index),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: moviePlot(index),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: actors(index),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: releasedDate(index),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: language(index),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: screenShot(index),
          )
        ]),
      ),
    );
  }

  Widget topImage(int index) {
    return ShaderMask(
        shaderCallback: (rect) {
          return LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.bottomLeft,
            colors: [Colors.black, Colors.transparent],
          ).createShader(Rect.fromLTRB(0, 0, rect.width, 200));
        },
        blendMode: BlendMode.dstIn,
        child: Image.network(
          movieList[index]['Images'][0],
        ));
  }

  Widget actors(int index) {
    return Text("Actors: ${movieList[index]['Actors']}",);
  }

  Widget language(int index) {
    return Text("Languages: ${movieList[index]['Language']}");
  }

  Widget movieName(int index) {
    return Text("${movieList[index]['Title']}",style: TextStyle(fontSize: 24.0 ,fontWeight: FontWeight.bold));
  }

  Widget moviePlot(int index) {
    return Text("Plot: ${movieList[index]['Plot']}");
  }

  Widget movieYearGenre(int index) {
    return Text("${movieList[index]['Genre']}");
  }

  Widget releasedDate(int index) {
    return Text("Released year: ${movieList[index]['Released']}");
  }

  Widget screenShot(int index) {
    var movieItems = [
      movieList[index]['Images'][0],
      movieList[index]['Images'][1],
      movieList[index]['Images'][2],
      movieList[index]['Images'][3],
      movieList[index]['Images'][4],
    ];
    //FIXME: Not working without carausel.
    return
        // Row(children: [
        //   Text('igino'),
        //   Text('igino'),
        //   Expanded(
        //           child: Container(color: Colors.black,
        //         child: Image.network(
        //       "movieList[index]['Images'][0]",
        //       scale: 2.0,
        //     )),
        //   )
        // ]);
        CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        height: 100.0,
        autoPlayInterval: Duration(seconds: 3),autoPlayCurve: Curves.easeInOutExpo,
        autoPlayAnimationDuration: Duration(seconds: 1),
        enableInfiniteScroll: true,
      ),
      items: movieItems.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                
                width: 200,
                height: 100,
                child: Image.network('$i'));
          },
        );
      }).toList(),
    );
  }

  // Widget leftImage(int index) {
  //   return Container(
  //     color: Colors.black,
  //     alignment: Alignment.topLeft,
  //     width: 150,
  //     height: 80,
  //     child: FittedBox(
  //         fit: BoxFit.fitHeight,
  //         child: Image.network(
  //           movieList[index]['Images'][1],
  //           fit: BoxFit.cover,
  //         )),
  //   );
  // }
}
