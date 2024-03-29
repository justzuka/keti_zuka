// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keti_zuka/ErrorMessage.dart';
import 'package:keti_zuka/FirebaseStuff.dart';
import 'package:keti_zuka/components/MyTextFormField.dart';

import 'package:keti_zuka/constants.dart';
import 'package:quickalert/models/quickalert_type.dart';

class Login extends StatefulWidget {
  const Login({super.key, required this.toggleIndex});

  final Function() toggleIndex;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(children: [
        Positioned(
          right: -154,
          bottom: 0,
          child: SvgPicture.asset(orangeCircle),
        ),
        Positioned(
          bottom: -154,
          right: 0,
          child: SvgPicture.asset(orangeCircle),
        ),
        Center(
            child: Container(
          width: 350,
          height: double.infinity,
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            child: Text(
                              "LOGIN",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 50,
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 5, bottom: 15),
                          child: Text(
                            "TO CONTINUE AS A HELPER",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 21,
                              letterSpacing: 3.8,
                            ),
                          ),
                        ),
                        MyTextFormField(
                          hint: "Email",
                          label: "Email",
                          hideText: false,
                          controller: emailController,
                        ),
                        MyTextFormField(
                          hint: "Password",
                          label: "Password",
                          hideText: true,
                          controller: passwordController,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Container(
                                  width: 68,
                                  height: 48,
                                  child: FloatingActionButton.extended(
                                    elevation: 0,
                                    onPressed: () {
                                      logIn(
                                        context,
                                        emailController.text.trim(),
                                        passwordController.text.trim(),
                                      );
                                    },
                                    label: const Text(
                                      "Log In",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ),
                                    backgroundColor: mainOrangeColor,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: widget.toggleIndex,
                                child: const Text(
                                  "Don't have an account yet",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
          ),
        ))
      ]),
    );
  }
}
