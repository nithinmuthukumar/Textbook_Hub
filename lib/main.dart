import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.blueGrey
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child:Text("Textbook Hub")),
          actions: <Widget>[IconButton(
            icon: Icon(Icons.directions_run)
          )],
        ),
        body: Row(
          children: [Text("Your premier source of (not) legal textbooks")]
        ),
      ),
    );
  }

}

