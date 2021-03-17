import 'package:flutter/material.dart';
import 'package:receiptless_app/services/auth.dart';

import '../login.dart';
import '../main.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  //final AuthenticationService _auth = AuthenticationService();

  IconData passwordIcon = Icons.visibility;
  bool isObscured = true;

  String email = "";
  String password = "";
  String retypedPassword = "";

  void showHidePassword() {
    this.setState(() {
      if(isObscured == true) {
        passwordIcon = Icons.visibility_off;
        isObscured = false;
      } else {
        passwordIcon = Icons.visibility;
        isObscured = true;
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
          child: Form(
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "E-mail address:"
                  ),
                  onChanged: (val) {
                    this.setState(() => email = val);
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  obscureText: isObscured,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password:",
                    suffixIcon: IconButton(
                      icon: Icon(passwordIcon),
                      onPressed: showHidePassword,
                    )
                  ),
                  onChanged: (val) {
                    this.setState(() => password = val);
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Retype Password:"
                  ),
                  onChanged: (val) {
                    this.setState(() => retypedPassword = val);
                  },
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  child: Text("Register"),
                  onPressed: () async {
                    print(email);
                    print(password);
                    print(retypedPassword);
                  },
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}
