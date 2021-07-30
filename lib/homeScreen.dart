import 'package:bitcoin_ticker/login_screen.dart';
import 'package:bitcoin_ticker/registration_screen.dart';
import 'package:flutter/material.dart';

import 'RoundedButton.dart';
class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  
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
            Text(
              'Crypto Tracker',
              style: TextStyle(
                fontSize: 45.0,
                fontWeight: FontWeight.w900,
                color: Colors.black
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              title: 'Log In',
              colour: Colors.lightBlueAccent,
              onPressed: () {
                      Navigator.pushNamed(context, LoginScreen.id); //Go to login screen.
                       },
            ),
            RoundedButton(
              title: 'Register',
              colour: Colors.blueAccent,
              onPressed: () {
           Navigator.pushNamed(context, RegistrationScreen.id); //Go to registration screen.
          },
            ),
          ],
        ),
      ),
    );
  }
}