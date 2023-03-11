// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keti_zuka/components/MyTextFormField.dart';

import 'package:keti_zuka/constants.dart';

class CompDonorLogin extends StatefulWidget {
  const CompDonorLogin({super.key, required this.toggleIndex});
  final Function() toggleIndex;

  @override
  State<CompDonorLogin> createState() => _CompDonorLoginState();
}

class _CompDonorLoginState extends State<CompDonorLogin> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                            "TO CONTINUE AS A COMPANY DONOR",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 21,
                              letterSpacing: 3.8,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 10,
                            top: 5,
                          ),
                          child: Center(
                            child: SvgPicture.asset(companyDonorSvg),
                          ),
                        ),
                        MyTextFormField(
                          hint: "Username",
                          label: "Username",
                          hideText: false,
                          controller: usernameController,
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
                                    onPressed: () {},
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
