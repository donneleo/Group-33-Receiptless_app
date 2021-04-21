
import 'package:flutter/material.dart';
import 'package:receiptless_app/authenticate/Register.dart';
import 'package:receiptless_app/authenticate/loginPage.dart';
import '../main.dart';
import 'package:firebase_core/firebase_core.dart';


class AuthenticatePage extends StatefulWidget {
  @override
  _AuthenticatePageState createState() => _AuthenticatePageState();
}

class _AuthenticatePageState extends State<AuthenticatePage> {

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Orange Tribes Receiptless App"),
        ),
        body: Center(
            child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <ElevatedButton>[
                  ElevatedButton(
                      child: Text("Login"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => loginPage()),
                        );
                      }
                  ),
                  ElevatedButton(
                      child: Text("Register"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Register()),
                        );
                      }
                  ),
                ]
            )
        )
    );
  }
}