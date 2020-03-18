import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab=0;
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
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: _currentTab,
        onTap: (int index){
          setState(() {
            _currentTab = index;
          });
        },
        items: [
        
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 25,
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search, size: 25),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.photo_camera, size: 25),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications, size: 25),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle, size: 25),
        ),
      ]),
    );
  }
}
