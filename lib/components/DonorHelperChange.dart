import 'package:flutter/material.dart';

import '../constants.dart';

class DonorHelperChange extends StatefulWidget {
  const DonorHelperChange(
      {super.key, required this.onTap, required this.toWhere});

  final Function() onTap;
  final String toWhere;

  @override
  State<DonorHelperChange> createState() => _DonorHelperChangeState();
}

class _DonorHelperChangeState extends State<DonorHelperChange> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      top: topOffsett + 10,
      child: GestureDetector(
        onTap: () {
          widget.onTap();
        },
        child: AbsorbPointer(
          child: Container(
            width: 120,
            height: 70,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40.0),
                  topLeft: Radius.circular(40.0)),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(33, 0, 0, 0),
                  blurRadius: 10.0,
                  spreadRadius: 0.1,
                  offset: Offset(0, 10), // shadow direction: bottom right
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Center(
                child: Text(
                  widget.toWhere,
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 21,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
