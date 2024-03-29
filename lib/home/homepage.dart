
import 'package:flutter/material.dart';
import 'package:receiptless_app/qrcode/QRRoute.dart';
import 'package:receiptless_app/receipts/ReceiptRoute.dart';
import 'package:receiptless_app/services/auth.dart';

class HomePage extends StatelessWidget{

  final AuthenticationService _auth = AuthenticationService();

  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text("Homepage"),
        ),
        body: Center(
          child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <ElevatedButton> [
                ElevatedButton(
                    child: Text("Display QR Code"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => QRRoute()),
                      );
                    }
                ),
                ElevatedButton(
                    child: Text("View Receipts"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ReceiptRoute()),
                      );
                    }
                ),
                ElevatedButton(
                  child: Text('Sign Out'),
                  onPressed: () async {
                    await _auth.signOut();
                  },
                )
              ]
          ),
        )
    );
  }
}

