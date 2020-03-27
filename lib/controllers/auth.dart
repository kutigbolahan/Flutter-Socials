import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:socials/models/user_data.dart';

import 'package:socials/views/feed_screen.dart';


class AuthService with ChangeNotifier {
  final _auth = FirebaseAuth.instance;
   final _firestore = Firestore.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();

   Future<void> signUpUser(
      BuildContext context, String name, String email, String password) async {
    try {
      AuthResult authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser signedInuser = authResult.user;
      if (signedInuser != null) {
        _firestore
            .collection('/users4')
            .document(signedInuser.uid)
            .setData({'name': name, 'email': email, 'profileImageUrl': ''});
        Provider.of<UserData>(context).currentUserId= signedInuser.uid;
        Navigator.pop(context);
        notifyListeners();
      } 
    } catch (e) {
      return e;
      
    }
  }

  Future<void> logout(BuildContext context)async {
  await  _auth.signOut();
   // Navigator.pushNamed(context, FeedScreen.routeName);
    notifyListeners();
  }

  Future<void>login(BuildContext context, String email, String password)async {
   try {
     await _auth.signInWithEmailAndPassword(email: email, password: password);
    Navigator.pushNamed(context, FeedScreen.routeName);
    notifyListeners();
   } catch (e) {
     return e;
   }
   
  }

  Future<String> signInWithGoogle(BuildContext context ) async {
  final GoogleSignInAccount _googlesigninaccount = await _googleSignIn.signIn();
  final GoogleSignInAuthentication _gSA =
      await _googlesigninaccount.authentication;
  final AuthCredential _credential = GoogleAuthProvider.getCredential(
      idToken: _gSA.idToken, accessToken: _gSA.accessToken);

  final AuthResult authResult = await _auth.signInWithCredential(_credential);
  final FirebaseUser signedInuser = authResult.user;
   if (signedInuser != null) {
        _firestore
            .collection('/users4')
            .document(signedInuser.uid)
            .setData({'name': '', 'email': '', 'profileImageUrl': ''});
        Navigator.pushNamed(context, FeedScreen.routeName);
         Provider.of<UserData>(context,listen: false).currentUserId= signedInuser.uid;
        notifyListeners();
      } 
    

  assert(await signedInuser.getIdToken() != null);

  final FirebaseUser _currentUser = await _auth.currentUser();
  assert(signedInuser.uid == _currentUser.uid);

  return 'SignInWithGoogle Succeded: $signedInuser';
}

Future<void> signOutGoogle() async {
  await _googleSignIn.signOut();
  notifyListeners();
}

}




