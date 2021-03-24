//this file defines methods that will interact with firebase authentication

import 'package:firebase_auth/firebase_auth.dart';
import 'package:receiptless_app/authenticate/userClass.dart';

class AuthenticationService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

    //create user obj
  UserClass _userFromFirebase(User user){
    return user != null? UserClass(uid: user.uid):null;
  }

  //auth change user stream
  Stream<UserClass> get user{
    //return _auth.authStateChanges().map((User user) => _userFromFirebase(user));
    return _auth.authStateChanges().map(_userFromFirebase);
  }

  //sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential result= await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user=result.user;
      return _userFromFirebase(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //register with email and pass
  Future registerEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _userFromFirebase(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
}