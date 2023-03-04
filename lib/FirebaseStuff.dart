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

Future signUp(String email, String password, context) async {
  showDialog(
      context: context,
      builder: (context) => const Center(
            child: CircularProgressIndicator(),
          ));
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  } on FirebaseAuthException catch (e) {
    print(e);
  }

  Navigator.of(context).pop();
}
