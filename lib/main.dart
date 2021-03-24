import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:receiptless_app/services/auth.dart';
import 'package:receiptless_app/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:receiptless_app/authenticate/userClass.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserClass>.value(
      value: AuthenticationService().user,
      child: MaterialApp(
        title: 'Receiptless App',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Wrapper(),
      ),
    );
  }
}
