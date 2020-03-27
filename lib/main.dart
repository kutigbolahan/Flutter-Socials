import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socials/controllers/auth.dart';
import 'package:socials/models/user_data.dart';
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
            Provider.of<UserData>(context).currentUserId = snapshot.data.uid;
            return HomeScreen(
             
            );
          } else {
            return LoginScreen();
          }
         
        });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> UserData()),
        ChangeNotifierProvider(create: (context)=> AuthService())
      ],
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryIconTheme:
              Theme.of(context).primaryIconTheme.copyWith(color: Colors.black),
          primarySwatch: Colors.blue,
        ),
        home: _getScreenId(),
        routes: {
          LoginScreen.routeName: (context) => LoginScreen(),
          SignUpScreen.routeName: (context) => SignUpScreen(),
          FeedScreen.routeName: (context) => FeedScreen(),
        },
      ),
    );
  }
}
