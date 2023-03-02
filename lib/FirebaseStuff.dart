import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future logIn(String email, String password) async {
  await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password,
  );
}

Future logOut() async {
  await FirebaseAuth.instance.signOut();
}
