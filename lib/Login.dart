import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Requests.dart';

class Login extends StatefulWidget{



  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }

}
class LoginState extends State<Login>{
  TextEditingController nameController=TextEditingController();
  TextEditingController pwdController=TextEditingController();
  List<Text> pwdCriterias;


  @override
  void initState() {
    pwdCriterias=getPwdCriterias("");

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
              Text(
                'login',
                style: TextStyle(
                  color: Colors.red,
                  fontFamily: 'Rubik',
                  fontSize: 50,
                ),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(25, 20, 25, 0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'username',
                      border: OutlineInputBorder(),
                    ),
                    controller: nameController,
                  )
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(25, 20, 25, 0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'password',
                    border: OutlineInputBorder(),
                  ),
                  controller: pwdController,
                  onChanged: (text){
                    setState(() {
                      pwdCriterias=getPwdCriterias(text);
                    });

                  }
                ),
              ),
              Column(
                children:pwdCriterias,
              ),
              Padding(
                  padding: EdgeInsets.all(20),
                  child: RaisedButton(

                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        'log in',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),
                    onPressed: (){
                      if(pwdCriterias.isEmpty){

                      }else{

                      }
                    },

                  )
              ),
            ],
          ),
        ),
      );

  }
  static List<Text> getPwdCriterias(String pwd){
    List<Text> spans=[Text("Password must consist of:")];
    if(pwd.length<6||pwd.length>8) spans.add(Text('\u2022 6-8 characters.'));
    if(!pwd.contains(RegExp(r'[a-z]'))) spans.add(Text( '\u2022 at least one letter.'));
    if(!pwd.contains(RegExp(r'[1-9]'))) spans.add(Text('\u2022 at least on number.'));
    return spans;




  }



}