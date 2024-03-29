import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:keti_zuka/DatabaseModels/Challenge.dart';
import 'package:keti_zuka/components/MyInputField.dart';
import 'package:keti_zuka/components/OrangeButton.dart';
import 'package:keti_zuka/pages/TaskPages/LeetcodeTaskPage.dart';

import '../../DatabaseModels/LeetcodeProfile.dart';
import '../../FirebaseStuff.dart';
import '../../LeetcodeAPI.dart';
import '../../constants.dart';
import '../TaskPages/MathTaskPage.dart';

class ChallengeDescription extends StatefulWidget {
  const ChallengeDescription({super.key, required this.challengeID});
  final String challengeID;

  @override
  State<ChallengeDescription> createState() => _ChallengeDescriptionState();
}

class _ChallengeDescriptionState extends State<ChallengeDescription> {
  Challenge currentChallenge = Challenge();
  bool entered = false;
  bool exited = false;

  final TextEditingController leetcodeUsernameController =
      TextEditingController();

  Future<void> getChallenge() async {
    Challenge challengeAnswer =
        await getCurrentChallengeData(widget.challengeID);
    setState(() {
      currentChallenge = challengeAnswer;
    });
  }

  Future<void> enterUpdate() async {
    bool temp = await checkIfChallengeEntered(widget.challengeID);
    bool temp2 = await checkIfChallengeExited(widget.challengeID);
    setState(() {
      entered = temp;
      exited = temp2;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    enterUpdate();
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
                          currentChallenge.description ??
                              "Challenge Description",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 30),
                        ),
                        currentChallenge == Null
                            ? const Text("Loading")
                            : currentChallenge.challengeType == "Math Quiz"
                                ? Text("Math Quiz",
                                    style: TextStyle(fontSize: 20))
                                : Column(
                                    children: [
                                      Text(
                                        "Leetcode Challenge",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Text(
                                        "\nEasy - \$5\nMedium - \$10\nHard - \$15",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.grey.shade600,
                                            wordSpacing: 2,
                                            letterSpacing: 0.6),
                                      ),
                                      entered
                                          ? SizedBox.shrink()
                                          : MyInputField(
                                              hint: 'Leetcode username',
                                              label: "Leetcode Username",
                                              hideText: false,
                                              controller:
                                                  leetcodeUsernameController,
                                              isText: true),
                                    ],
                                  ),
                        exited
                            ? Text("You have exited this challenge")
                            : entered
                                ? OrangeButton(
                                    label: "Go to Task",
                                    onPressFunc: () {
                                      currentChallenge.challengeType ==
                                              "Leetcode Challenge"
                                          ? Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      LeetcodeTaskPage(
                                                          challengeID: widget
                                                              .challengeID)))
                                          : Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MathTaskPage(
                                                          challengeID: widget
                                                              .challengeID)));
                                    },
                                    inverted: true,
                                  )
                                : OrangeButton(
                                    label: "enter",
                                    onPressFunc: () async {
                                      if (currentChallenge.challengeType ==
                                          "Leetcode Challenge") {
                                        if (await alreadyParticipatesInLeetcodeFirebase()) {
                                          print(
                                              "Already participates in leetcode");
                                        } else {
                                          LeetcodeProfile? profile =
                                              await getLeetcodeData(
                                                  leetcodeUsernameController
                                                      .text);
                                          if (profile == null) {
                                            print("Error, profile null");
                                          } else {
                                            createChallengeAndUserforLeetcode(
                                                widget.challengeID,
                                                profile,
                                                leetcodeUsernameController
                                                    .text);
                                            enterUpdate();
                                            print("Hello");
                                          }
                                        }
                                      }
                                      if (currentChallenge.challengeType ==
                                          "Math Quiz") {
                                        createChallengeAndUserforMath(
                                            widget.challengeID);
                                        enterUpdate();
                                        print("Hello");
                                      }
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
      ),
    );
  }
}
