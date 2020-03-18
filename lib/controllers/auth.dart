import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:socials/views/feed_screen.dart';
import 'package:socials/views/login_screen.dart';

class AuthService with ChangeNotifier {
  static final _auth = FirebaseAuth.instance;
  static final _firestore = Firestore.instance;
  //GoogleSignIn _googleSignIn = GoogleSignIn();

  static void signUpUser(
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
        Navigator.pushNamed(context, FeedScreen.routeName);
      } else {}
    } catch (e) {
      return e;
    }
  }

  static void logout(BuildContext context) {
    _auth.signOut();
    Navigator.pushNamed(context, FeedScreen.routeName);
    
  }

  static void login(BuildContext context, String email, String password) {
   try {
      _auth.signInWithEmailAndPassword(email: email, password: password);
    Navigator.pushNamed(context, FeedScreen.routeName);
   } catch (e) {
     return e;
   }
   
  }
}


// final _auth = FirebaseAuth.instance;
// final _firestore = Firestore.instance;
// GoogleSignIn _googleSignIn = GoogleSignIn();

// Future<String> signInWithGoogle(BuildContext context ) async {
//   final GoogleSignInAccount _googlesigninaccount = await _googleSignIn.signIn();
//   final GoogleSignInAuthentication _gSA =
//       await _googlesigninaccount.authentication;
//   final AuthCredential _credential = GoogleAuthProvider.getCredential(
//       idToken: _gSA.idToken, accessToken: _gSA.accessToken);

//   final AuthResult _authResult = await _auth.signInWithCredential(_credential);
//   final FirebaseUser user = _authResult.user;
//    if (user != null) {
//         _firestore
//             .collection('/users2')
//             .document(user.uid)
//             .setData({'name': '', 'email': '', 'profileImageUrl': ''});
//         Navigator.pushNamed(context, FeedScreen.routeName);
//       } 
    

//   assert(await user.getIdToken() != null);

//   final FirebaseUser _currentUser = await _auth.currentUser();
//   assert(user.uid == _currentUser.uid);

//   return 'SignInWithGoogle Succeded: $user';
// }

// void signOutGoogle() async {
//   await _googleSignIn.signOut();
// }
