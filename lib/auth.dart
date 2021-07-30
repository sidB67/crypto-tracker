import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Auth with ChangeNotifier{
  final _firebaseAuth = FirebaseAuth.instance;

  Stream<User> get onStateChange {
    
    return _firebaseAuth.authStateChanges();
  }

  Future<User> signInWithEmailAndPassword(String email, String password)async{
    final authResult = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return authResult.user;
  }

  Future<User> createEmailAndPassword(String email, String password)async{
    final authResult = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return authResult.user;
  }

   Future<void> signOut() async{
    await  _firebaseAuth.signOut();
  }
  User getCurrentUser(){
    return _firebaseAuth.currentUser;
  }
  
}

