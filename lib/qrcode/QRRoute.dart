import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:receiptless_app/services/auth.dart';


class QRRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text("QR Code"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget> [
              QrImage(
                padding: EdgeInsets.only(bottom:10.0),
                data: getUserUid(),
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
  getUserUid(){
    String uid = AuthenticationService().getCurrentUID();
    return uid;
  }

  }
