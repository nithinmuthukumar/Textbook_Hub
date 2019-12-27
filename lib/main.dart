import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'APIReqs.dart';
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
          title: Center(child:Text("Textbook Hub")),
          actions:getActions()),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(300, 10, 300, 10),
            
            child: Column(
              children: <Widget>[
                for ( Textbook t in getTextbooks() ) createTextbookWidget(t)
              ]
            ),
          ),
        ),
      )
    );
  }
  Widget createTextbookWidget(Textbook t){
    return Card(
        child:Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Text(t.grade.toString()),
              title: Text(t.name),
              subtitle: Text(t.subject),
            ),
            ButtonBar(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.file_download),
                  onPressed: null,
                ),
                IconButton(
                  icon: Icon(Icons.favorite),
                  onPressed: null,
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: null,
                )

              ],
            )

          ],
        )
    );
  }


}


getActions() {
  return <Widget>[IconButton(
      icon: Icon(Icons.book)
  )];

}



