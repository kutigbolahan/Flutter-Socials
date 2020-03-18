import 'package:flutter/material.dart';
import 'package:socials/models/user_model.dart';

class EditProfileScreen extends StatefulWidget {
  final User user;

  const EditProfileScreen({Key key, this.user}) : super(key: key);
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _bio = '';

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Edit Profile',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  radius: 40,
                ),
                FlatButton(
                    onPressed: () => null,
                    child: Text(
                      'Change profile image',
                      style: TextStyle(
                          color: Theme.of(context).accentColor, fontSize: 15),
                    )),
                TextFormField(
                  initialValue: _name,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                    icon: Icon(Icons.person, size: 30),
                    labelText: 'Name',
                  ),
                  validator: (input) => input.trim().length < 1
                      ? 'Please enter a valid name'
                      : null,
                  onSaved: (input) => _name = input,
                ),
                TextFormField(
                  initialValue: _bio,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                    icon: Icon(Icons.book, size: 30),
                    labelText: 'Bio',
                  ),
                  validator: (input) => input.trim().length > 150
                      ? 'Please enter a bio less than 150 characters'
                      : null,
                  onSaved: (input) => _bio = input,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
