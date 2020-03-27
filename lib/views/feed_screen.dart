import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:socials/controllers/auth.dart';

class FeedScreen extends StatefulWidget {
  static final String routeName = 'feed_screen';
  FeedScreen({Key key}) : super(key: key);

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'Instagram',
            style: GoogleFonts.abel(color: Colors.black, fontSize: 20),
          ),
        ),
      ),
      backgroundColor: Colors.red,
      body: Center(
          child: FlatButton(
              onPressed: () =>
                  Provider.of<AuthService>(context, listen: false).logout(context),
              child: Text('Logout'))),
    );
  }
}
