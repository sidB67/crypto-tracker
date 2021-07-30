import 'package:bitcoin_ticker/auth.dart';
import 'package:bitcoin_ticker/homeScreen.dart';
import 'package:bitcoin_ticker/price_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context,listen: false);
    return StreamBuilder<User>(
      stream: auth.onStateChange,
      builder: (context,snapshot){
        if(snapshot.connectionState == ConnectionState.active){
          User user = snapshot.data;
          if(user==null){
            return WelcomeScreen();
          }
          else{
            return PriceScreen();
          }
          
        }
        else{
           return Scaffold(body: Center(child: CircularProgressIndicator(),));

        }
       
      }
      
      );
      
    
  }
}