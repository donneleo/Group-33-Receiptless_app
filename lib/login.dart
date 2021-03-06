import 'package:flutter/material.dart';
import 'main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Orange Tribes Receiptless App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text("Orange Tribes Receiptless App"),
        ),
        body: Center(
            child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <ElevatedButton> [
                  ElevatedButton(
                      child: Text("Login"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
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