// ignore: file_names
import 'package:flutter/material.dart';

import '../constants.dart';

class OptionButton extends StatefulWidget {
  OptionButton(
      {super.key,
      required this.label,
      required this.onPressFunc,
      this.inverted = false,
      required this.buttonState,
      required this.index});

  final String label;
  final Function onPressFunc;
  final bool inverted;
  final int buttonState;
  final int index;

  @override
  State<OptionButton> createState() => _OptionButtonState();
}

class _OptionButtonState extends State<OptionButton> {
  Color returnColor() {
    if (widget.buttonState == 0) {
      return Colors.transparent;
    } else if (widget.buttonState == 1) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 246,
        height: 60,
        child: FloatingActionButton.extended(
          shape: RoundedRectangleBorder(
              side: BorderSide(width: 3, color: returnColor()),
              borderRadius: BorderRadius.circular(100)),
          heroTag: widget.index,
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
