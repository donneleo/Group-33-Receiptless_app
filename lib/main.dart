import 'package:flutter/material.dart';


class QRRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text("QR Code"),
        ),
        body: Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Return to Homepage")
            )
        )
    );
  }
}

class ReceiptRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text("View Receipts"),
        ),
        body: Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Return to Homepage")
            )
        )
    );
  }
}
