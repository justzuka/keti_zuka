// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keti_zuka/components/OrangeButton.dart';
import 'package:keti_zuka/constants.dart';
import 'package:keti_zuka/pages/SignLoginScreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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
        body: Container(
          color: Colors.white,
          child: Stack(children: [
            Positioned(
              left: -154,
              child: SvgPicture.asset(orangeCircle),
            ),
            Positioned(
              top: -154,
              child: SvgPicture.asset(orangeCircle),
            ),
            Center(
                child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(50.0),
                              child: Text(
                                "  GIVEEZY",
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 2,
                                  color: Color.fromARGB(255, 234, 28, 86),
                                  shadows: <Shadow>[
                                    Shadow(
                                      offset: Offset(0, 5),
                                      blurRadius: 10.0,
                                      color: Color.fromARGB(55, 0, 0, 0),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SvgPicture.asset(loving1),
                            const Text(
                              "DO GOOD THE EASY WAY",
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.w300,
                                letterSpacing: 2,
                                shadows: <Shadow>[
                                  Shadow(
                                    offset: Offset(0, 5),
                                    blurRadius: 10.0,
                                    color: Color.fromARGB(55, 0, 0, 0),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          OrangeButton(
                            label: 'Welcome',
                            onPressFunc: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignLoginScreen()));
                            },
                          ),
                        ],
                      )
                    ]),
              ),
            ))
          ]),
        ));
  }
}
