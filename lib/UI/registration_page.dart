import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medicine_reminder/constants.dart';
class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth=FirebaseAuth.instance;
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: Hero(
                tag: 'logo',
                child: Image.asset('images/frontpage.jpg'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
                keyboardType: TextInputType.emailAddress  ,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
                onChanged: (value) {
                email=value;
                //Do something with the user input.
              },
              decoration:kTextFieldDecoration.copyWith(hintText: "Enter Email ")
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
                onChanged: (value) {
                password=value;
                //Do something with the user input.
              },
              decoration:kTextFieldDecoration.copyWith(hintText: "Enter Password")
            ),
            SizedBox(
              height: 24.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () async{
                    try {
                      final newUser = await _auth.createUserWithEmailAndPassword(
                          email: email, password: password);
                      if (newUser!= null){
                        Navigator.pushNamed(context, "/homepage");
                      }
                      setState(() {
                      });
                    }
                    catch(e){
                      print(e);//Implement registration functionality.
                    }
                    //Implement registration functionality.
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}