import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
String userToken = " test userToken ";

class QRRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text("QR Code"),
        ),
        body: Center(
          child: Column(
            children: <Widget> [
              QrImage(
                data: userToken,
                version: QrVersions.auto,
                size: MediaQuery.of(context).size.width/1.3 ,
                errorStateBuilder: (cxt, err) {
                  return Container(
                    child: Center(
                      child: Text(
                        "Something went wrong",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },

              ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Return to Homepage")
            )

            ]


          )



    )



    );
  }
}