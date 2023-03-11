import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:keti_zuka/pages/DonorScreen.dart';
import 'package:keti_zuka/pages/Login.dart';
import 'package:keti_zuka/pages/HelperScreen.dart';
import 'package:keti_zuka/pages/Signup.dart';

class SignLoginScreen extends StatefulWidget {
  const SignLoginScreen({super.key});

  @override
  State<SignLoginScreen> createState() => _SignLoginScreenState();
}

class _SignLoginScreenState extends State<SignLoginScreen> {
  void toggleIsLogin() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  bool isLogin = true;

  void toggleIsHelper() {
    setState(() {
      isHelper = !isHelper;
    });
  }

  bool isHelper = true;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return isHelper
              ? HelperScreen(
                  toggleIsHelper: toggleIsHelper,
                )
              : DonorScreen(
                  toggleIsHelper: toggleIsHelper,
                );
        } else {
          return Scaffold(
              resizeToAvoidBottomInset: false,
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                shadowColor: Colors.transparent,
                elevation: 0,
                backgroundColor: Colors.transparent,
              ),
              body: isLogin
                  ? Login(
                      toggleIndex: toggleIsLogin,
                    )
                  : Signup(toggleIndex: toggleIsLogin));
        }
      },
    );
  }
}
