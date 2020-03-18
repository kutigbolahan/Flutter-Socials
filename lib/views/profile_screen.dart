import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0,20.0,20.0,0),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 50,
                ),
                Expanded(
                                child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text('12',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600
                              ),
                              ),
                              Text('Posts',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black54
                              ),
                              ),
                              
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text('2800',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600
                              ),
                              ),
                              Text('Following',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black54
                              ),
                              ),
                              
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text('5000',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600
                              ),
                              ),
                              Text('Followers',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black54
                              ),
                              ),
                              
                            ],
                          ),
                        ],
                      ),
                      Container(
                        width: 200,
                        child: FlatButton(
                          color: Colors.blue,
                          textColor: Colors.white,
                          onPressed: (){}, 
                          child: Text('Edit Profile'),

                          
                          ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}