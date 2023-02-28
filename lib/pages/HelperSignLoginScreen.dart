import 'package:flutter/material.dart';
import 'package:keti_zuka/pages/HelperLogin.dart';
import 'package:keti_zuka/pages/HelperSignup.dart';

class HelperSignLoginScreen extends StatefulWidget {
  const HelperSignLoginScreen({super.key});

  @override
  State<HelperSignLoginScreen> createState() => _HelperSignLoginScreenState();
}

class _HelperSignLoginScreenState extends State<HelperSignLoginScreen> {
  void toggleIndex() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          shadowColor: Colors.transparent,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: isLogin
            ? HelperLogin(
                toggleIndex: toggleIndex,
              )
            : HelperSignup(toggleIndex: toggleIndex));
  }
}
