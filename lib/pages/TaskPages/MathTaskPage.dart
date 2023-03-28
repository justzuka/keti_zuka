import 'package:flutter/material.dart';
import 'package:keti_zuka/FirebaseStuff.dart';

import '../../components/OrangeButton.dart';

class MathTaskPage extends StatefulWidget {
  const MathTaskPage({super.key});

  @override
  State<MathTaskPage> createState() => _MathTaskPageState();
}

class _MathTaskPageState extends State<MathTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, false),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Align(
          child: Container(
            height: 60,
            width: 246,
            child: OrangeButton(
              label: 'Exit this Math Challenge',
              onPressFunc: () {},
            ),
          ),
        ),
      ),
    );
  }
}
