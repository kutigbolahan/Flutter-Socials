import 'package:flutter/material.dart';
import 'package:socials/utilities/constant.dart';
import 'package:socials/models/user_model.dart';
import 'package:socials/views/editprofile_screen.dart';

class ProfileScreen extends StatefulWidget {
  //in order to kow the user we are looking at currently or the signed in user
  final String userId;

  const ProfileScreen({Key key, this.userId}) : super(key: key);
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
          future: usersRef.document(widget.userId).get(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            User user=User.fromDoc(snapshot.data);
            
            return ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 20.0, 20.0, 0),
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
                                    Text(
                                      '12',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      'Posts',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black54),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      '2800',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      'Following',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black54),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      '5000',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      'Followers',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black54),
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
                                onPressed: () =>Navigator.push(
                                  context, MaterialPageRoute(builder: (context)=>
                                  EditProfileScreen(user: user,)
                                  )
                                  ),
                                child: Text('Edit Profile'),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        user.name,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 80,
                        child: Text(
                          user.bio,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black
                          ),
                        ),
                      ),
                      Divider()
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}
