import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log In'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical:20.0, horizontal:50.0) ,
        child: RaisedButton(
          child: Text('Sign In Anonymously'),
          onPressed: () async{
            
          },
        ),
      ),
    );
  }
}