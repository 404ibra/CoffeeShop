import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AuthService {
  final firebaseAuth = FirebaseAuth.instance;
  final firebaseFirestore = FirebaseFirestore.instance;

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

  Future forgotPassword(String email) async {
    try {
      final result = await firebaseAuth.sendPasswordResetEmail(email: email);
      print("Check your email inbox.");
    } catch (e) {}
  }

  Future signIn(String email, String password) async {
    String? res;
    try {
      final result = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      //any problem;
      res = "sucess";
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "user-not-found":
          res = "User not found";
          break;
        case "wrong-password":
          res = "Wrong Password Please Check It.";
          break;
        case "user-disabled":
          res = "User Banned.";
          break;
        default:
          res = "Have some problem plesae try again...";
          break;
      }
    }
    return res;
  }

  Future<String?> signUp(
      String email, String username, String fullname, String password) async {
    String res;
    try {
      final result = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      try {
        final resultData = await firebaseFirestore.collection("Users").add({
          "email": email,
          "fullname": fullname,
          "username": username,
          "post": [],
          "followers": [],
          "following": [],
          "bio": "",
          "website": "",
        });
      } catch (e) {
        print("$e");
      }

      res = "success";
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "email-already-in-use":
          res = "E-mail already use please Signin";
          break;

        case "invalid-email":
          res = "Invalid email please check";
          break;
        default:
          res = "Something went wrong please try again";
      }
    }
  }
}
