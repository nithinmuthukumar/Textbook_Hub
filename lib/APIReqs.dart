import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Textbook {
  final int id;
  final String name;
  final int grade;
  final String subject;
  final String file;


  Textbook({this.name, this.id, this.grade, this.subject,this.file});

  factory Textbook.fromJson(Map<String, dynamic> json) {
    return Textbook(
      id: json['id'],
      name: json['name'],
      file: json['file'],
      subject: json['subject'],
      grade: json['grade']
    );
  }
}
String ip = "http://127.0.0.1:8000";
List<Textbook> getTextbooks(){
  final response = http.get('https://jsonplaceholder.typicode.com/posts/1');
  List<Textbook> books=List<Textbook>();
  books.add(Textbook(name: "jj",id: 8,grade: 8,subject: "jihh",file: "ftft"));
  books.add(Textbook(name: "jj",id: 8,grade: 8,subject: "jihh",file: "ftft"));
  books.add(Textbook(name: "jj",id: 8,grade: 8,subject: "jihh",file: "ftft"));
  /*response.then((rep){
    if (rep.statusCode == 200) {

      // If the call to the server was successful, parse the JSON.
      for(Map<String,dynamic> book in json.decode(rep.body)){
        books.add(Textbook.fromJson(book));
      }

    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }


  });

   */

  return books;

}


