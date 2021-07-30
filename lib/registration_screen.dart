import 'package:bitcoin_ticker/auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'RoundedButton.dart';
import 'constants.dart';
class RegistrationScreen extends StatefulWidget {
  static const String id = 'register_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  
  
  bool showSpinner = false;
  String email;
  String pass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
              backgroundColor: Colors.blue,
            ),
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
              child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                  'Register',
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
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.black),
                onChanged: (value) {
                  email=value;//Do something with the user input.
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                style: TextStyle(color: Colors.black),
                obscureText: true,
                onChanged: (value) {
                 pass=value; //Do something with the user input.
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                title: 'Register',
                colour: Colors.blueAccent,
                onPressed: () async{
                      setState(() {
                        showSpinner=true;
                      });
                        try{
                        await Provider.of<Auth>(context , listen: false).createEmailAndPassword(email, pass);
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
