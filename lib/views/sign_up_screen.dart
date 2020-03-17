import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  static final String routeName = 'Signup_screen';
  SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email;
  String _password;
  String _name;

  _submit(){
    if (_formKey.currentState.validate()) {
      (_formKey.currentState.save());
      print(_email);
      print(_password);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
                  child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Instagram',
            style: TextStyle(fontSize: 40),
          ),
          Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                   Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 10,
                      ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Name',
                      ),
                      validator: (input)=> input.trim().isEmpty?'Please enter a valid name':null,
                      onSaved: (input)=> _email =input,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 10,
                      ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'E-mail',
                      ),
                      validator: (input)=> !input.contains('@') ?'Please enter a valid email': null,
                      onSaved: (input)=> _email =input,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 10,
                      ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                      ),
                      validator: (input)=> input.length<6 ?'Must be atleast 6 characters': null,
                      onSaved: (input)=> _password =input,
                    ),
                  ),
                  SizedBox(height:30),
                  Container(
                    width: 250.0,
                    child: FlatButton(
                      color: Colors.blue,
                      padding: EdgeInsets.all(10),
                      onPressed:_submit
                      , 
                      child: Text('SignUp',style: TextStyle(
                        color: Colors.white,
                        fontSize: 15
                      ),)),
                  ),
                  SizedBox(height:30),
                  Container(
                    width: 250.0,
                    child: FlatButton(
                      color: Colors.blue,
                      padding: EdgeInsets.all(10),
                      onPressed:()=> Navigator.pop(context), 
                      child: Text('Login',style: TextStyle(
                        color: Colors.white,
                        fontSize: 15
                      ),)),
                  ),
                ],
              ))
        ],
      ),
        ),
      ),
    );
  }
}
