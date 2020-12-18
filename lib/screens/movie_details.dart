import 'package:flutter/material.dart';

class MovieDetails extends StatefulWidget {
  final String name;

  const MovieDetails({Key key, this.name}) : super(key: key);

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.name}"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("GO back"),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
