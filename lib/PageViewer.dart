import 'package:bookhub/Requests.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_plugin.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'dart:async';
import 'package:flutter/services.dart';
class PageViewer extends StatefulWidget{
  final String url;
  const PageViewer({Key key, this.url}): super(key: key);


  @override
  PageViewerState createState() => PageViewerState();


}
class PageViewerState extends State<PageViewer> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getPdf(widget.url),
      builder: (context,snapshot){
        if(snapshot.hasData){
          return PDFViewerScaffold(
              appBar: AppBar(
                title: Text("Document"),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.share),
                    onPressed: () {},
                  ),
                ],
              ),
              path: snapshot.data,
          );
        }
        return Text("Loading");
      }
    );
  }


}

