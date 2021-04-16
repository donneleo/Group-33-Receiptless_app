
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:receiptless_app/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReceiptRoute extends StatelessWidget {
  //ReceiptRoute();
  @override
  //ReceiptRouteState createState() => ReceiptRouteState();
//}

//class ReceiptRouteState extends State<ReceiptRoute> {
  //ReceiptRouteState();


  Widget build(BuildContext context) {
    String data = getUserUid();
    print(data);
    return Scaffold(
      appBar: AppBar(
        title: Text("Receipts"),
      ),
        floatingActionButton: null,
        body: StreamBuilder(

        stream: FirebaseFirestore.instance.collection('users').doc(data).collection('receipts').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }


          return ListView(
            children: snapshot.data.docs.map((document){
              return Center(
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: MediaQuery.of(context).size.height / 4,
                  child: Text("Product: " + document['Product']),

                ),
              );
            }).toList(),
          );
        }
    ),
    );
  }
}


getUserUid(){
  String uid = AuthenticationService().getCurrentUID();
  return uid;
}



