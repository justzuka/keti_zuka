import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:keti_zuka/DatabaseModels/MyUser.dart';

import 'DatabaseModels/Challenge.dart';
import 'DatabaseModels/ChallengeAndUser.dart';
import 'DatabaseModels/LeetcodeProfile.dart';

User user = FirebaseAuth.instance.currentUser!;

Future logIn(String email, String password) async {
  await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password,
  );
}

Future logOut() async {
  await FirebaseAuth.instance.signOut();
}

Future signUp(String email, String password, context) async {
  showDialog(
      context: context,
      builder: (context) => const Center(
            child: CircularProgressIndicator(),
          ));
  try {
    MyUser newUser = MyUser();
    newUser.username = null;
    newUser.profilePicture = null;
    newUser.email = email;
    newUser.helpTotal = 0.0;
    newUser.donorTotal = 0.0;
    newUser.createdAt = DateTime.now();

    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
          email: email,
          password: password,
        )
        .then((cred) => {
              FirebaseFirestore.instance
                  .collection('users')
                  .doc(cred.user?.uid)
                  .set(newUser.toJson())
            });
  } on FirebaseAuthException catch (e) {
    print(e);
  }

  Navigator.of(context).pop();
}

Future getCurrentUserData() async {
  var data =
      await FirebaseFirestore.instance.collection("users").doc(user.uid).get();
  MyUser us = MyUser.fromSnapshot(data);
  return us;
}

Future getCurrentChallengeData(String challengeID) async {
  var data = await FirebaseFirestore.instance
      .collection("challenges")
      .doc(challengeID)
      .get();
  Challenge ch = Challenge.fromSnapshot(data);
  return ch;
}

Future createChallenge(String charityName, String challengeType,
    double approxAmount, String description) async {
  Challenge newChallenge = Challenge();
  newChallenge.charityName = charityName;
  newChallenge.ownerID = user.uid;
  newChallenge.challengeType = challengeType;
  newChallenge.approxAmount = approxAmount;
  newChallenge.currentlyRaised = 0.0;
  newChallenge.finished = false;
  newChallenge.description = description;
  newChallenge.createdAt = DateTime.now();

  await FirebaseFirestore.instance
      .collection('challenges')
      .add(newChallenge.toJson());
}

Future alreadyParticipatesInLeetcodeFirebase() async {
  var data = await FirebaseFirestore.instance
      .collection("challengeanduser")
      .where("userID", isEqualTo: user.uid)
      .where("challengeType", isEqualTo: "Leetcode Challenge")
      .get();
  if (data.docs.isEmpty) {
    return false;
  } else {
    return true;
  }
}

Future createChallengeAndUserforLeetcode(String challengeID,
    LeetcodeProfile leetcodeProfile, String leetcodeUsername) async {
  ChallengeAndUser newChallengeAndUser = ChallengeAndUser();
  newChallengeAndUser.userID = user.uid;
  newChallengeAndUser.challengeID = challengeID;
  newChallengeAndUser.challengeType = 'Leetcode Challenge';
  newChallengeAndUser.currentryRaised = 0.0;
  newChallengeAndUser.leetcodeUsername = leetcodeUsername;
  newChallengeAndUser.easy = leetcodeProfile.easy;
  newChallengeAndUser.medium = leetcodeProfile.medium;
  newChallengeAndUser.hard = leetcodeProfile.hard;
  newChallengeAndUser.exited = false;
  newChallengeAndUser.createdAt = DateTime.now();

  await FirebaseFirestore.instance
      .collection('challengeanduser')
      .add(newChallengeAndUser.toJson());
}

Future createChallengeAndUserforMath(String challengeID) async {
  ChallengeAndUser newChallengeAndUser = ChallengeAndUser();
  newChallengeAndUser.userID = user.uid;
  newChallengeAndUser.challengeID = challengeID;
  newChallengeAndUser.challengeType = 'Math Quiz';
  newChallengeAndUser.currentryRaised = 0.0;
  newChallengeAndUser.exited = false;
  newChallengeAndUser.createdAt = DateTime.now();

  await FirebaseFirestore.instance
      .collection('challengeanduser')
      .add(newChallengeAndUser.toJson());
}

Future checkIfChallengeEntered(String challengeID) async {
  var data = await FirebaseFirestore.instance
      .collection("challengeanduser")
      .where("userID", isEqualTo: user.uid)
      .where("challengeID", isEqualTo: challengeID)
      .get();
  if (data.docs.isEmpty) {
    return false;
  } else {
    return true;
  }
}
