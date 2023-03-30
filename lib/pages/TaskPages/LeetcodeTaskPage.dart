import 'package:flutter/material.dart';
import 'package:keti_zuka/DatabaseModels/ChallengeAndUser.dart';
import 'package:keti_zuka/FirebaseStuff.dart';

import '../../DatabaseModels/LeetcodeProfile.dart';
import '../../FirebaseStuff.dart';
import '../../LeetcodeAPI.dart';
import '../../components/OrangeButton.dart';

class LeetcodeTaskPage extends StatefulWidget {
  const LeetcodeTaskPage({super.key, required this.challengeID});
  final String? challengeID;

  @override
  State<LeetcodeTaskPage> createState() => _LeetcodeTaskPageState();
}

class _LeetcodeTaskPageState extends State<LeetcodeTaskPage> {
  LeetcodeProfile leetcodeProfile =
      LeetcodeProfile(easy: 0, medium: 0, hard: 0);
  ChallengeAndUser challengeAndUser = ChallengeAndUser();

  Future<void> getChallengeAndUserAndLeetcode() async {
    try {
      ChallengeAndUser chandu =
          await getChallengeAndUserData(widget.challengeID ?? "idk");
      LeetcodeProfile? profile =
          await getLeetcodeData(chandu.leetcodeUsername ?? "idk");
      setState(() {
        if (profile != null) {
          leetcodeProfile = profile;
        }
        challengeAndUser = chandu;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getChallengeAndUserAndLeetcode();
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
        color: Colors.white,
        child: Align(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Money you have raised since you entered the challenge: \$${challengeAndUser.currentryRaised ?? 0}",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              Column(
                children: [
                  Container(
                    height: 60,
                    width: 246,
                    child: OrangeButton(
                      label: 'Exit this Leetcode Challenge',
                      onPressFunc: () {
                        markChallengeAsExited(widget.challengeID ?? "idk");
                        // pop two screens from navigator
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 246,
                    child: OrangeButton(
                      label: 'Update your Score',
                      onPressFunc: () {
                        updateUserLeetcodeScore(
                            leetcodeProfile, challengeAndUser);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
