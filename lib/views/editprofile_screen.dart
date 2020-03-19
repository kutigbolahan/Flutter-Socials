import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socials/models/user_model.dart';
import 'package:socials/controllers/databaseService.dart';
import 'package:socials/controllers/storage_service.dart';

class EditProfileScreen extends StatefulWidget {
  final User user;

  const EditProfileScreen({Key key, this.user}) : super(key: key);
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  File _profileImage;
  String _name = '';
  String _bio = '';
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    _name = widget.user.name;
    _bio = widget.user.bio;
  }

  _handleImageFromGallery() async {
    File imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      setState(() {
        _profileImage = imageFile;
      });
    }
  }

  _displayProfileImage() {
    if (_profileImage == null) {
      if (widget.user.profileImageUrl.isEmpty) {
        return AssetImage('assets/images/1.jpg');
      } else {
        return CachedNetworkImageProvider(widget.user.profileImageUrl);
      }
    } else {
      return FileImage(_profileImage);
    }
  }

  _submit() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      //update user in database
      setState(() {
        _isLoading = true;
      });
      String _profileImageUrl = '';

      if (_profileImage == null) {
        _profileImageUrl = widget.user.profileImageUrl;
      } else {
        _profileImageUrl = await StorageService.uploadUserProfileImage(
            widget.user.profileImageUrl, _profileImage);
      }
      User user = User(
          id: widget.user.id,
          name: _name,
          profileImageUrl: _profileImageUrl,
          bio: _bio);
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
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: ListView(
          children: <Widget>[
            _isLoading ? LinearProgressIndicator(backgroundColor: Colors.blue[200],
            valueColor: AlwaysStoppedAnimation(Colors.blue),
            )
            : SizedBox.shrink(),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey,
                    backgroundImage: _displayProfileImage(),
                  ),
                  FlatButton(
                      onPressed: _handleImageFromGallery,
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
                    height: 40,
                    width: 250,
                    child: FlatButton(
                        color: Colors.blue,
                        textColor: Colors.white,
                        onPressed: _submit,
                        child: Text(
                          'Save Profile',
                          style: TextStyle(fontSize: 15),
                        )),
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
