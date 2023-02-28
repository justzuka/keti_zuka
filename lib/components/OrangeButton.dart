// ignore: file_names
import 'package:flutter/material.dart';

import '../constants.dart';

class OrangeButton extends StatefulWidget {
  const OrangeButton(
      {super.key, required this.label, required this.onPressFunc});

  final String label;
  final Function onPressFunc;

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
            style: const TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          backgroundColor: mainOrangeColor,
        ),
      ),
    );
  }
}
