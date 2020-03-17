import 'package:flutter/material.dart';
import 'package:socials/controllers/auth.dart';

class FeedScreen extends StatefulWidget {
  static final String routeName= 'feed_screen';
  FeedScreen({Key key}) : super(key: key);

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.red,
       body: Center(child: FlatButton(onPressed: ()=>AuthService.logout(context), child: Text('Logout'))),
    );
  }
}