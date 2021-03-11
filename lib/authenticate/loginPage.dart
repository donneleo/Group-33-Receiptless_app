import 'package:flutter/material.dart';
import 'package:receiptless_app/login.dart';
import 'package:receiptless_app/main.dart';

class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log In'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical:20.0, horizontal:50.0) ,
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(height:20.0),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "E-mail Address:"
                ),
                onChanged: (val){

                },   //val represent value in the box
              ),
              SizedBox(height:20.0),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password"
                ),
                obscureText: true,    //hides the text
                onChanged: (val){

                },
              ),
              SizedBox(height:20.0),
              RaisedButton(
                child: Text(
                  'Log in',
                  style:TextStyle(color: Colors.grey),
                ),
                onPressed: () async{

                },
              )
            ]
          )
        ),
        ),
      );
  }
}