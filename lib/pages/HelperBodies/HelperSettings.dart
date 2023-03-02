import 'package:flutter/material.dart';
import 'package:keti_zuka/FirebaseStuff.dart';

import '../../components/OrangeButton.dart';

class HelperSettingsBody extends StatefulWidget {
  const HelperSettingsBody({super.key});

  @override
  State<HelperSettingsBody> createState() => _HelperSettingsBodyState();
}

class _HelperSettingsBodyState extends State<HelperSettingsBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Align(
        child: Container(
          height: 60,
          width: 246,
          child: OrangeButton(
            label: 'Log Out',
            onPressFunc: () {
              logOut();
            },
          ),
        ),
      ),
    );
  }
}
