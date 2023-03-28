import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:keti_zuka/DatabaseModels/Challenge.dart';
import 'package:keti_zuka/components/MyInputField.dart';
import 'package:keti_zuka/components/OrangeButton.dart';

import '../../FirebaseStuff.dart';
import '../../constants.dart';

class ChallengeDescription extends StatefulWidget {
  const ChallengeDescription({super.key, required this.challengeID});
  final String challengeID;

  @override
  State<ChallengeDescription> createState() => _ChallengeDescriptionState();
}

class _ChallengeDescriptionState extends State<ChallengeDescription> {
  Challenge currentChallenge = Challenge();
  Future<void> getChallenge() async {
    Challenge challengeAnswer =
        await getCurrentChallengeData(widget.challengeID);
    setState(() {
      currentChallenge = challengeAnswer;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getChallenge();
  }

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
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 30, top: topOffsett),
                        child: Text(
                          currentChallenge.charityName ?? "charity name",
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
                        Text(
                          currentChallenge.description ?? "charity description",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 30),
                        ),
                        OrangeButton(
                          label: "submit",
                          onPressFunc: () {},
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
      ),
    );
  }
}
