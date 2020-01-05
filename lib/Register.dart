import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Login.dart';
import 'Requests.dart';

class Register extends StatefulWidget{



  @override
  State<StatefulWidget> createState() {
    return RegisterState();
  }

}
class RegisterState extends State<Register>{
  TextEditingController nameController=TextEditingController();
  TextEditingController pwdController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  List<Text> pwdCriterias;
  String emailIsValid="";


  @override
  void initState() {
    pwdCriterias=getPwdCriterias("");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
              Text(
                'Register',
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
                    hintText: 'email',
                    border: OutlineInputBorder()
                  ),
                  controller: emailController,
                  onChanged: (text){
                    setState(() {
                      emailIsValid=validateEmail(text);
                    });
                  },
                )

              ),
              Text(emailIsValid,style: TextStyle(color: Colors.red),),
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
                        'Submit',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),
                    onPressed: (){
                      if(pwdCriterias.isEmpty){
                        register(nameController.text, pwdController.text, emailController.text).then(
                            (code) {
                              switch(code){
                                case 201:
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => (Login())),
                                  );
                                  break;
                                case 400:
                                  setState(() {
                                    pwdCriterias.add(Text("Please Try Something Else"));
                                    
                                  });

                              }

                            }
                        );
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
    List<Text> spans=[];
    if(pwd.length<6||pwd.length>8) spans.add(Text('\u2022 6-8 characters.'));
    if(!pwd.contains(RegExp(r'[a-z]'))) spans.add(Text( '\u2022 at least one letter.'));
    if(!pwd.contains(RegExp(r'[1-9]'))) spans.add(Text('\u2022 at least on number.'));
    if(spans.length>0){
      spans.insert(0,Text("Password must consist of:"));
    }
    return spans;

  }
  static String validateEmail(String email){
    if(email.contains("@")&&email.contains('.',email.indexOf("@"))){
      return "";

    }
    return "Email is invalid";


  }



}