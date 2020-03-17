import 'package:flutter/material.dart';

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
    );
  }
}