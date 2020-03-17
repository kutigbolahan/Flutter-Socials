import 'package:flutter/material.dart';
import 'package:socials/views/sign_up_screen.dart';
import 'package:google_fonts/google_fonts.dart';


class LoginScreen extends StatefulWidget {
  static final String routeName = 'Login_screen';
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email;
  String _password;

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
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Instagram',
            style: GoogleFonts.abel(
              fontSize: 30
            )
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
                      child: Text('Login',style: TextStyle(
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
                      onPressed:()=> Navigator.pushNamed(context, SignUpScreen.routeName), 
                      child: Text('Sign up',style: TextStyle(
                        color: Colors.white,
                        fontSize: 15
                      ),)),
                  ),
                ],
              ))
        ],
      )),
    );
  }
}
