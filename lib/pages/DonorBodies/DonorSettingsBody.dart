import 'package:flutter/material.dart';
import 'package:keti_zuka/FirebaseStuff.dart';

import '../../components/OrangeButton.dart';

class DonorSettingsBody extends StatefulWidget {
  const DonorSettingsBody({super.key});

  @override
  State<DonorSettingsBody> createState() => _DonorSettingsBodyState();
}

class _DonorSettingsBodyState extends State<DonorSettingsBody> {
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
