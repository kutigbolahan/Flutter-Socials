import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:socials/views/feed_screen.dart';
import 'package:socials/views/login_screen.dart';
import 'package:socials/views/sign_up_screen.dart';
import 'package:socials/views/home_screen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget _getScreenId() {
    return StreamBuilder<FirebaseUser>(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return HomeScreen(userId: snapshot.data.uid,);
          } else {
            return LoginScreen();
          }
         // snapshot.hasData ? FeedScreen() : LoginScreen();
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryIconTheme: Theme.of(context).primaryIconTheme.copyWith(
          color: Colors.black
        ),
        primarySwatch: Colors.blue,
      ),
      home: _getScreenId(),
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
        SignUpScreen.routeName: (context) => SignUpScreen(),
        FeedScreen.routeName: (context) => FeedScreen(),
      },
    );
  }
}
