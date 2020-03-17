import 'package:flutter/material.dart';
import 'package:socials/views/login_screen.dart';
import 'package:socials/views/sign_up_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
      routes: {
        LoginScreen.routeName :(context) => LoginScreen(),
        SignUpScreen.routeName :(context) => SignUpScreen(),
      },
    );
  }
}

