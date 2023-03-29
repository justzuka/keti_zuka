import 'package:flutter/material.dart';
import 'package:keti_zuka/DatabaseModels/ChallengeAndUser.dart';
import 'package:keti_zuka/FirebaseStuff.dart';

import '../../MathQuizRandomQuestionGenerator.dart';
import '../../components/OptionButton.dart';
import '../../components/OrangeButton.dart';

class MathTaskPage extends StatefulWidget {
  const MathTaskPage({super.key, required this.challengeID});
  final String challengeID;

  @override
  State<MathTaskPage> createState() => _MathTaskPageState();
}

class _MathTaskPageState extends State<MathTaskPage> {
  String question = 'Loading...';
  List<String> options = [
    'Loading1...',
    'Loading2...',
    'Loading3...',
    'Loading4...'
  ];
  List<int> buttonStates = [0, 0, 0, 0];
  int correctIndex = 0;
  bool isAnswered = false;

  void updateAll() {
    updateChallengeAndUserRaised(widget.challengeID);
    updateChallengeRaised(widget.challengeID);
    updateUserHelpTotal();
  }

  void onPressFunc(int index) {
    if (isAnswered) return;
    setState(() {
      if (index == correctIndex) {
        buttonStates[index] = 1;
        updateAll();
      } else {
        buttonStates[index] = 2;
      }
      for (int i = 0; i < 4; i++) {
        if (i == correctIndex) {
          buttonStates[i] = 1;
        }
      }
      isAnswered = true;
    });
  }

  void nextAction() {
    setState(() {
      buttonStates = [0, 0, 0, 0];
      isAnswered = false;
      List<String> RM = MathQuizRandomQuestionGenerator();
      question = RM[0];
      options = [RM[1], RM[2], RM[3], RM[4]];
      correctIndex = int.parse(RM[5]);
    });
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    nextAction();
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
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.transparent,
          child: Align(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  question,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: options.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 60,
                      width: 246,
                      child: OptionButton(
                        label: options[index],
                        onPressFunc: () {
                          onPressFunc(index);
                        },
                        buttonState: buttonStates[index],
                        index: index,
                      ),
                    );
                  },
                ),
                isAnswered
                    ? Container(
                        height: 60,
                        width: 246,
                        child: OrangeButton(
                          label: 'Next',
                          onPressFunc: () {
                            nextAction();
                          },
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
