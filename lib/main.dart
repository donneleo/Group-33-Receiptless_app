import 'package:flutter/material.dart';

void main() =>runApp(MaterialApp(
  home: homepage(),
));

class homepage extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Homepage"),
      ),
      body: new Column(
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
          ]
      )
    );
  }
}


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

