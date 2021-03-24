import 'package:flutter/material.dart';
import 'package:receiptless_app/authenticate/login.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // return the login widget if the user is not logged in
    // return the homepage widget if the user is logged in
    return AuthenticatePage();
  }
}
