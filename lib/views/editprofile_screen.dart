import 'package:flutter/material.dart';
import 'package:socials/models/user_model.dart';
import 'package:socials/controllers/databaseService.dart';

class EditProfileScreen extends StatefulWidget {
  final User user;

  const EditProfileScreen({Key key, this.user}) : super(key: key);
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _bio = '';
  @override
  void initState() { 
    super.initState();
    _name=widget.user.name;
    _bio =widget.user.bio;
  }
  _submit(){
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      //update user in database
      
      String _profileImageUrl ='';
      User user = User(
        id: widget.user.id,
        name: _name,
        profileImageUrl: _profileImageUrl,
        bio: _bio
      );
      //database update
      DatabaseService.updateUser(user);
      Navigator.pop(context);
    }
  }

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
          child: Padding(
            padding: const EdgeInsets.all(30),
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
                  ),
                  Container(
                    margin: EdgeInsets.all(40),
                    height:40,
                    width: 250,
                    child: FlatButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      onPressed: _submit, 
                      child: Text('Save Profile',
                      style: TextStyle(fontSize:15),
                      )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
