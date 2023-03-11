import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';

class DonorTaskBody extends StatefulWidget {
  const DonorTaskBody({super.key});

  @override
  State<DonorTaskBody> createState() => _DonorTaskBodyState();
}

class _DonorTaskBodyState extends State<DonorTaskBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: mainOrangeColor,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 225 + topOffsett,
            decoration: const BoxDecoration(
              color: Colors.white,
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
                    padding: EdgeInsets.only(bottom: 30, top: topOffsett),
                    child: Text(
                      "CHALLENGES",
                      style: TextStyle(fontSize: 50),
                    ),
                  ),
                  Container(
                    width: 306,
                    height: 170,
                    decoration: const BoxDecoration(
                      color: mainOrangeColor,
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
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
