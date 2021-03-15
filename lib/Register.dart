import 'package:flutter/material.dart';

import 'login.dart';
import 'main.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  IconData passwordIcon = Icons.visibility;
  bool obscured = true;

  void showHidePassword() {
    this.setState(() {
      if(obscured == true) {
        passwordIcon = Icons.visibility_off;
        obscured = false;
      } else {
        passwordIcon = Icons.visibility;
        obscured = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "E-mail address:"
                ),
              ),
              TextFormField(
                obscureText: obscured,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password:",
                  suffixIcon: IconButton(
                    icon: Icon(passwordIcon),
                    onPressed: showHidePassword
                  )
                ),
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Retype Password:"
                ),
              ),
              ElevatedButton(
                  child: Text("Register"),
                  onPressed: null)
            ],
          ),
        ),
      ),
    );
  }
}
