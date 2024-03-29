
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:receiptless_app/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReceiptRoute extends StatelessWidget {
  @override

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
                // hard code, would be a good idea to implement dynamic attribute allocation, i.e. be able to calculate Change by subtracting Price from Paid
                // not the best
                child: Container(
                  padding: EdgeInsets.only(top:20.0),
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: MediaQuery.of(context).size.height / 6,
                  child: Text("Product: " + document['Product']+ "\n" + "Price: " + document['Price'].toString() + "\n" +"Paid: " + document['Paid'].toString()+ "\n" + "Change: "  + document['Change'].toString() +"\n"+ "Date: " + document['Date']),

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



