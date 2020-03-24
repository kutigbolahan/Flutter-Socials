import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:socials/models/user_model.dart';
class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  Future<QuerySnapshot>_users;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.white,
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 15.0),
            border: InputBorder.none,
            hintText: 'Search',
            prefixIcon: Icon(Icons.search, size: 25),
            suffixIcon: IconButton(
              icon: Icon(Icons.clear),
              onPressed: ()=>null,
            ),
            filled: true
          ),
          onSubmitted: (input){
            print(input);
          },
        ),
      ),
     body: FutureBuilder(
       future: _users,
      
       builder: (BuildContext context, AsyncSnapshot snapshot) {
         if (!snapshot.hasData) {
           return Center(
             child: CircularProgressIndicator()
             );
         }
         if (snapshot.data.documents.length == 0) {
           return Center(child: Text('No user found! Please try again'),)
         }
         return ListView.builder(
           itemCount: snapshot.data.documents.length,
           itemBuilder: (BuildContext context, int index){
             User user = User.fromDoc(snapshot.data.documents[index]);
           }
           );
       },
     ),
    );
  }
}