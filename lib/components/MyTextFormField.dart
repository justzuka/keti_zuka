import 'package:flutter/material.dart';

class MyTextFormField extends StatefulWidget {
  const MyTextFormField(
      {super.key,
      required this.hint,
      required this.label,
      required this.hideText,
      required this.controller});

  final String hint;
  final String label;
  final bool hideText;
  final TextEditingController controller;

  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.hideText,
        decoration: InputDecoration(
            hintText: widget.hint,
            labelText: widget.label,
            labelStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintStyle:
                const TextStyle(color: Color.fromARGB(255, 165, 162, 162)),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(100)),
            )),
      ),
    );
  }
}
