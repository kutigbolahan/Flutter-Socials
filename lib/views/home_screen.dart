import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socials/views/feed_screen.dart';

import 'package:socials/views/activity_screen.dart';
import 'package:socials/views/search_screen.dart';

import 'package:socials/views/createpost_screen.dart';
import 'package:socials/views/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  final String userId;
  HomeScreen({Key key, this.userId}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;
  PageController _pageController;
  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

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
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          FeedScreen(),
          SearchScreen(),
          CreatePostScreen(),
          ActivityScreen(),
          ProfileScreen(userId: widget.userId,)
        ],
        onPageChanged: (int index) {
          setState(() {
            _currentTab = index;
          });
        }
      ),
      bottomNavigationBar: CupertinoTabBar(
          currentIndex: _currentTab,
          onTap: (int index) {
            setState(() {
              _currentTab = index;
            });
             _pageController.animateToPage(index,
              duration: Duration(milliseconds: 200), curve: Curves.easeIn);
        
          },
          activeColor: Colors.black,
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
