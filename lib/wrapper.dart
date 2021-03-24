import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receiptless_app/authenticate/login.dart';
import 'package:receiptless_app/authenticate/userClass.dart';
import 'package:receiptless_app/home/homepage.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<UserClass>(context);

    // return the login widget if the user is not logged in
    // return the homepage widget if the user is logged in
    if(user == null) {
      return AuthenticatePage();
    } else {
      return HomePage();
    }
  }
}
