import 'package:flutter/material.dart';

class MyInputField extends StatefulWidget {
  const MyInputField(
      {super.key,
      required this.hint,
      required this.label,
      required this.hideText,
      required this.controller,
      required this.isText});

  final String hint;
  final String label;
  final bool hideText;
  final bool isText;
  final TextEditingController controller;

  @override
  State<MyInputField> createState() => _MyInputFieldState();
}

class _MyInputFieldState extends State<MyInputField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.label,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ),
          TextFormField(
            keyboardType:
                widget.isText ? TextInputType.text : TextInputType.number,
            controller: widget.controller,
            obscureText: widget.hideText,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: widget.hint,
              // labelText: widget.label,
              // labelStyle: const TextStyle(
              //   color: Colors.black,
              //   fontWeight: FontWeight.w400,
              //   fontSize: 22,
              // ),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              hintStyle:
                  const TextStyle(color: Color.fromARGB(255, 165, 162, 162)),
              border: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }
}
