import 'package:flutter/material.dart';
import 'screens/home.dart';

void main() => runApp(MaterialApp(title: "Movies", home: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Movies"),),
      body: Home(),
    );
  }
}