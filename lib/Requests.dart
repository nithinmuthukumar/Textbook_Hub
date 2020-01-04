import 'dart:convert';
import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

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
class User {
  final String name;
  final List<Textbook> favourites;
  final List<Textbook> recents;

  User({this.name,this.favourites,this.recents});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name:json['name'],
      favourites: [for(var t in json['favourites']) Textbook.fromJson(t)],
        recents: [for(var t in json['recents']) Textbook.fromJson(t)]
    );


  }

}
String ip = "http://127.0.0.1:8000/";
Future<List<Textbook>> getTextbooks() async {
  final response = await http.get("http://127.0.0.1:8000/bookhub/textbooks/");

  List<Textbook> textbooks = List<Textbook>();
  if(response.statusCode==200){
    for(var v in json.decode(response.body)){
      textbooks.add(Textbook.fromJson(v));
    }
    return textbooks;
  }else{
    throw Exception('Failed to load post');

  }
  // If the call to the server was successful, parse the JSON.



}
Future<String> getPdf(String url) async{
  print(url);
  final response=await http.get(url);
  if(response.statusCode==200){
    final filename = url.substring(url.lastIndexOf("/") + 1);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = new File('$dir/$filename');
    await file.writeAsBytes(response.bodyBytes);
    return file.path;
  }
}
Future<bool> requestLogin(String user,String pwd) async{
  final response = await http.post(ip+"");

}
Future<bool> register(String username,String password,String email) async{
  Map<String, String> headers = {"Content-type": "application/json"};
  String json = jsonEncode({"user":username,"password":password,"email":email});
  final response = await http.post(ip,headers:headers,body: json);
  print(response);
}

Future<List<String>> getRecommendations(user,pwd) async{
  Map<String, String> headers = {"Content-type": "application/json"};
  String json = jsonEncode({"user":user,"password":pwd});

  http.Response response = await http.post(ip, headers: headers, body: json);

  Map<String, dynamic> ret = jsonDecode(response.body);

  return ret['valid'];


}



