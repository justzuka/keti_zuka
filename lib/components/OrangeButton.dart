// ignore: file_names
import 'package:flutter/material.dart';

import '../constants.dart';

class OrangeButton extends StatefulWidget {
  OrangeButton(
      {super.key,
      required this.label,
      required this.onPressFunc,
      this.inverted = false});

  final String label;
  final Function onPressFunc;
  final bool inverted;

  @override
  State<OrangeButton> createState() => _OrangeButtonState();
}

class _OrangeButtonState extends State<OrangeButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 246,
        height: 60,
        child: FloatingActionButton.extended(
          heroTag: widget.label,
          elevation: 3,
          onPressed: () {
            widget.onPressFunc();
          },
          label: Text(
            widget.label,
            style: TextStyle(
              color: widget.inverted == false ? Colors.white : mainOrangeColor,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          backgroundColor:
              widget.inverted == false ? mainOrangeColor : Colors.white,
        ),
      ),
    );
  }
}
