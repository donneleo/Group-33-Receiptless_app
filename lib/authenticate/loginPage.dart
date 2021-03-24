import 'package:flutter/material.dart';
import 'package:receiptless_app/services/auth.dart';

class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {

  final AuthenticationService _auth= AuthenticationService();
  final _formKey=GlobalKey<FormState>();

  //text
  String email='';
  String password='';
  String error='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log In'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical:20.0, horizontal:50.0) ,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(height:20.0),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "E-mail Address:"
                ),
                validator: (val)=>val.isEmpty? 'Enter E-mail Address':null,
                onChanged: (val){
                    setState(()=>email=val);
                },   //val represent value in the box
              ),
              SizedBox(height:20.0),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password"
                ),
                obscureText: true,    //hides the text
                validator: (val)=>val.isEmpty? 'Enter password':null,
                onChanged: (val){
                    setState(()=>password=val);
                },
              ),
              SizedBox(height:20.0),
              ElevatedButton(
                child: Text(
                  'Log in',
                  style:TextStyle(color: Colors.grey),
                ),
                onPressed: () async{
                  if(_formKey.currentState.validate()){
                    dynamic result= await _auth.signInWithEmailAndPassword(email, password);
                    if(result==null){
                      setState(()=>error = 'Invalid Input');
                    }
                    else{
                      print('LoggedIn');
                      Navigator.pop(context);
                    }
                  }
                },
              ),
              SizedBox(height: 12.0,),
              Text(
                error,
                style: TextStyle(color: Colors.red,fontSize: 14.0),
              )

            ]
          )
        ),
        ),
      );
  }
}