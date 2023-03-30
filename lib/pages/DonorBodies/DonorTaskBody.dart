import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:keti_zuka/components/MyInputField.dart';
import 'package:keti_zuka/components/OrangeButton.dart';

import '../../FirebaseStuff.dart';
import '../../constants.dart';

List<String> list = <String>['Math Quiz', 'Leetcode Challenge'];

class DonorTaskBody extends StatefulWidget {
  const DonorTaskBody({super.key});

  @override
  State<DonorTaskBody> createState() => _DonorTaskBodyState();
}

class _DonorTaskBodyState extends State<DonorTaskBody> {
  final TextEditingController charityNameController = TextEditingController();
  final TextEditingController approximateAmount = TextEditingController();
  final TextEditingController charityDescriptionController =
      TextEditingController();

  String dropdownValue = list.first;

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
                        label: "Enter the description of the donation",
                        hideText: false,
                        isText: true,
                        controller: charityDescriptionController,
                      ),
                      MyInputField(
                        hint: "..",
                        label: "Approximate amount",
                        hideText: false,
                        isText: false,
                        controller: approximateAmount,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Choose the challenge",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: dropdownValue,
                          icon: const Icon(Icons.arrow_downward),
                          elevation: 16,
                          style: const TextStyle(color: Colors.black),
                          underline: Container(
                            height: 2,
                            color: Colors.white,
                          ),
                          onChanged: (String? value) {
                            // This is called when the user selects an item.
                            setState(() {
                              dropdownValue = value!;
                            });
                          },
                          items: list
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      OrangeButton(
                        label: "submit",
                        onPressFunc: () {
                          createChallenge(
                              context,
                              charityNameController.text,
                              dropdownValue,
                              double.parse(approximateAmount.text),
                              charityDescriptionController.text);
                          setState(() {
                            charityNameController.clear();
                            approximateAmount.clear();
                            charityDescriptionController.clear();
                            dropdownValue = list.first;
                          });
                        },
                        inverted: true,
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
