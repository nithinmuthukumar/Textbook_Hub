import 'package:flutter/material.dart';
import 'Login.dart';
import 'PageViewer.dart';
import 'Requests.dart';

void main() {
  runApp(MyApp());

}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BookHub',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Textbooks'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => (Login())),
              );
            },
          )
        ],
        ),
      body: Column(

        children:<Widget>[

          FutureBuilder(
        future: getTextbooks(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return Column(
                children:[for(Textbook t in snapshot.data) createTextbookWidget(t)]
            );
          }
          return Text("Please Wait a Moment");

        }
      )
    ]));
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
                  icon: Icon(Icons.favorite_border),
                  onPressed: null,
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => (PageViewer(
                          url:t.file
                      ))),
                    );
                  },
                )

              ],
            )

          ],
        )
    );
  }
}

