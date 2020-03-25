import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socials/models/user_data.dart';

import 'package:socials/views/feed_screen.dart';

import 'package:socials/views/activity_screen.dart';
import 'package:socials/views/search_screen.dart';

import 'package:socials/views/createpost_screen.dart';
import 'package:socials/views/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  

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
    print(Provider.of<UserData>(context).currentUserId );
    return Scaffold(
      
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          FeedScreen(),
          SearchScreen(),
          CreatePostScreen(),
          ActivityScreen(),
          ProfileScreen(userId:  Provider.of<UserData>(context).currentUserId)
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
