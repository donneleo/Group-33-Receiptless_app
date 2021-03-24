import 'package:flutter/material.dart';
import 'package:receiptless_app/services/auth.dart';

import 'login.dart';
import '../main.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthenticationService _auth = AuthenticationService();
  final _formKey = GlobalKey<FormState>();

  IconData passwordIcon = Icons.visibility;
  bool isObscured = true;

  String email = '';
  String password = '';
  String retypedPassword = '';
  String error = '';

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
        title: Text('Register'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'E-mail address:'
                  ),
                  validator: (val) => val.isEmpty ? 'Invalid E-mail' : null,
                  onChanged: (val) {
                    this.setState(() => email = val);
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  obscureText: isObscured,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password:',
                    suffixIcon: IconButton(
                      icon: Icon(passwordIcon),
                      onPressed: showHidePassword,
                    )
                  ),
                  validator: (val) => val.length < 4 ? 'Password must be at least 4 characters long' : null,
                  onChanged: (val) {
                    this.setState(() => password = val);
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Retype Password:'
                  ),
                  validator: (val) => val.compareTo(password) != 0 ? 'Password fields do not match' : null,
                  onChanged: (val) {
                    this.setState(() => retypedPassword = val);
                  },
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  child: Text('Register'),
                  onPressed: () async {
                    if(_formKey.currentState.validate()) {
                      dynamic result = await _auth.registerEmailAndPassword(email, password);
                      if(result == null) {
                        setState(() => error = 'error here (TO BE CHANGED)');
                      }
                    }
                  },
                ),
                SizedBox(height: 20.0),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}
