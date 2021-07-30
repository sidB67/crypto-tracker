import 'package:bitcoin_ticker/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'RoundedButton.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'constants.dart';
class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool showSpinner = false;
  String email;
  String pass;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
        inAsyncCall: showSpinner,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
            ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.black
                  ),
                ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                style: TextStyle(color: Colors.black),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email=value;//Do something with the user input.
                },
                decoration:kTextFieldDecoration.copyWith(hintText:'Email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                style: TextStyle(color: Colors.black),
                obscureText: true,
                onChanged: (value) {
                  pass=value;//Do something with the user input.
                },
                decoration: kTextFieldDecoration.copyWith(hintText:'Password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                title: 'Log In',
                colour: Colors.lightBlueAccent,
                onPressed: () async{
                      setState(() {
                        showSpinner=true;
                      });
                        try{
                        await Provider.of<Auth>(context,listen: false).signInWithEmailAndPassword(email, pass);
                        Navigator.of(context).pop();
                        }catch(e){
                          print(e);
                          }finally{
                            setState(() {
                                                          showSpinner=false;
                                                        });
                          }
                         },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
