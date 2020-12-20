import 'package:flutter/material.dart';

class Favourite extends StatefulWidget {
  final int index;
  Favourite(this.index);

  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  Set<int> moviesSet;

  @override
  void initState() {
    super.initState();
    moviesSet = Set<int>();
  }

  @override
  Widget build(BuildContext context) {
    int index = widget.index;
    moviesSet.add(index);
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite'),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int tindex) {
          return ListTile(
            leading: Icon(Icons.movie),
            title: Text("${moviesSet}"),
          );
        },
      ),
    );
  }
}
