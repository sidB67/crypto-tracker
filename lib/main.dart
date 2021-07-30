import 'package:bitcoin_ticker/auth.dart';
import 'package:bitcoin_ticker/homeScreen.dart';
import 'package:bitcoin_ticker/landingPage.dart';
import 'package:bitcoin_ticker/login_screen.dart';
import 'package:bitcoin_ticker/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'price_screen.dart';
import 'package:firebase_core/firebase_core.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Auth>(
      create: (context)=> Auth(),
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
            primaryColor: Colors.lightBlue,
            scaffoldBackgroundColor: Colors.white),
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          RegistrationScreen.id: (context)=> RegistrationScreen(),
          PriceScreen.id: (context)=> PriceScreen(),
        },
        home: LandingPage(),
      ),
    );
  }
}
