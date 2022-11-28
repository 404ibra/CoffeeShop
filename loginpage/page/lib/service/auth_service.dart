import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AuthService {

 final firebaseAuth = FirebaseAuth.instance;


 Future signInAnonymous() async {
  try {
    final result = await firebaseAuth.signInAnonymously();
    print(result.user!.uid);
    return result.user;
  } catch (e) {
    print("Anon error $e");
    return null;
  }
 }
}