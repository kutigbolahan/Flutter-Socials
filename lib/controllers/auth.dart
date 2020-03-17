import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:socials/views/feed_screen.dart';
import 'package:socials/views/login_screen.dart';

class AuthService with ChangeNotifier{
 static final _auth =FirebaseAuth.instance;
 static final _firestore = Firestore.instance;

 static void signUpUser(BuildContext context, String name, String email, String password)async{
     try {
       AuthResult authResult = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser signedInuser= authResult.user;
      if (signedInuser != null) {
        _firestore.collection('/users2').document(signedInuser.uid).setData({
          'name': name,
          'email': email,
          'profileImageUrl': ''
      });
      Navigator.pushNamed(context, FeedScreen.routeName);
      } else {
      }
     
     } catch (e) {
       return e;
     }
     
  }

  static void logout(BuildContext context){
    _auth.signOut();
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

}