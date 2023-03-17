import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:keti_zuka/components/MyInputField.dart';

import '../../constants.dart';

class DonorTaskBody extends StatefulWidget {
  const DonorTaskBody({super.key});

  @override
  State<DonorTaskBody> createState() => _DonorTaskBodyState();
}

class _DonorTaskBodyState extends State<DonorTaskBody> {
  final TextEditingController charityNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: mainOrangeColor,
      child: Column(
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
            child: Padding(
              padding: const EdgeInsets.only(top: topOffsett),
              child: Center(
                child: Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(bottom: 30, top: topOffsett),
                      child: Text(
                        "MAKE A DONATION",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 50),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              color: Colors.transparent,
              alignment: Alignment.topLeft,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      MyInputField(
                        hint: "..",
                        label: "Choose the charity",
                        hideText: false,
                        isText: true,
                        controller: charityNameController,
                      ),
                      MyInputField(
                        hint: "..",
                        label: "Approximate amount",
                        hideText: false,
                        isText: false,
                        controller: charityNameController,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
