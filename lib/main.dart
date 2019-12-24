import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
void main() => runApp(App());

class App extends StatelessWidget {
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
          actions:getActions()),
        body: SafeArea(
          child: Column(
            children: getTexts(),

          ),
        ),
      ),
    );
  }
  List<Widget> getTexts(){
    return <Widget>[];

  }

}
getActions() {
  return <Widget>[IconButton(
      icon: Icon(Icons.book)
  )];

}

