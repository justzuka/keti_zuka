import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';

class DonorHomeBody extends StatefulWidget {
  const DonorHomeBody({super.key});

  @override
  State<DonorHomeBody> createState() => _DonorHomeBodyState();
}

class _DonorHomeBodyState extends State<DonorHomeBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 225 + topOffsett,
            decoration: const BoxDecoration(
              color: mainOrangeColor,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(40.0),
                  bottomLeft: Radius.circular(40.0)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: topOffsett),
            child: Center(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 100),
                    child: Text(
                      "Hello {Donor}",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 21,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Container(
                      width: 306,
                      height: 122,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(33, 0, 0, 0),
                            blurRadius: 10.0,
                            spreadRadius: 0.1,
                            offset:
                                Offset(0, 10), // shadow direction: bottom right
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
