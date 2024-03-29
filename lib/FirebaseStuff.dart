import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:keti_zuka/DatabaseModels/MyUser.dart';
import 'package:keti_zuka/ErrorMessage.dart';
import 'package:quickalert/models/quickalert_type.dart';

import 'DatabaseModels/Challenge.dart';
import 'DatabaseModels/ChallengeAndUser.dart';
import 'DatabaseModels/LeetcodeProfile.dart';

Future logIn(BuildContext context, String email, String password) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  } catch (e) {
    print(e);
    showAlert(context, e.toString(), QuickAlertType.error);
  }
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
  } catch (e) {
    print(e);
    showAlert(context, e.toString(), QuickAlertType.error);
  }

  Navigator.of(context).pop();
}

Future getCurrentUserData() async {
  var data = await FirebaseFirestore.instance
      .collection("users")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .get();
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

Future createChallenge(BuildContext context, String charityName,
    String challengeType, double approxAmount, String description) async {
  try {
    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));

    Challenge newChallenge = Challenge();
    newChallenge.charityName = charityName;
    newChallenge.ownerID = FirebaseAuth.instance.currentUser!.uid;
    newChallenge.challengeType = challengeType;
    newChallenge.approxAmount = approxAmount;
    newChallenge.currentlyRaised = 0.0;
    newChallenge.finished = false;
    newChallenge.description = description;
    newChallenge.createdAt = DateTime.now();

    await FirebaseFirestore.instance
        .collection('challenges')
        .add(newChallenge.toJson());

    //to this user update donortotal
    var data = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    MyUser us = MyUser.fromSnapshot(data);
    us.donorTotal = us.donorTotal! + approxAmount;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update(us.toJson());

    Navigator.of(context).pop();
    showAlert(context, "You have successfully created a donation challenge",
        QuickAlertType.success);
  } catch (e) {
    print(e);
    Navigator.of(context).pop();
    showAlert(context, e.toString(), QuickAlertType.error);
  }
}

Future alreadyParticipatesInLeetcodeFirebase() async {
  var data = await FirebaseFirestore.instance
      .collection("challengeanduser")
      .where("userID", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
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
  newChallengeAndUser.userID = FirebaseAuth.instance.currentUser!.uid;
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
  newChallengeAndUser.userID = FirebaseAuth.instance.currentUser!.uid;
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
      .where("userID", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .where("challengeID", isEqualTo: challengeID)
      .get();
  if (data.docs.isEmpty) {
    return false;
  } else {
    return true;
  }
}

Future checkIfChallengeExited(String challengeID) async {
  try {
    var data = await FirebaseFirestore.instance
        .collection("challengeanduser")
        .where("userID", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where("challengeID", isEqualTo: challengeID)
        .get();
    ChallengeAndUser ch = ChallengeAndUser.fromSnapshot(data.docs[0]);
    if (data.docs.isEmpty) {
      return false;
    }
    if (ch.exited == true) {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    return false;
  }
}

Future markChallengeAsExited(String challengeID) async {
  var data = await FirebaseFirestore.instance
      .collection("challengeanduser")
      .where("userID", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .where("challengeID", isEqualTo: challengeID)
      .get();
  ChallengeAndUser ch = ChallengeAndUser.fromSnapshot(data.docs[0]);
  ch.exited = true;
  ch.leetcodeUsername = '';
  await FirebaseFirestore.instance
      .collection('challengeanduser')
      .doc(data.docs[0].id)
      .update(ch.toJson());
}

Future getChallengeAndUserData(String challengeID) async {
  var data = await FirebaseFirestore.instance
      .collection("challengeanduser")
      .where("userID", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .where("challengeID", isEqualTo: challengeID)
      .get();
  ChallengeAndUser ch = ChallengeAndUser.fromSnapshot(data.docs[0]);
  return ch;
}

Future updateUserLeetcodeScore(
    LeetcodeProfile leetcodeProfile, ChallengeAndUser challengeAndUser) async {
  if (challengeAndUser.easy == null || leetcodeProfile.easy == null) {
    return null;
  }
  if (challengeAndUser.medium == null || leetcodeProfile.medium == null) {
    return null;
  }
  if (challengeAndUser.hard == null || leetcodeProfile.hard == null) {
    return null;
  }
  double add_easy =
      ((challengeAndUser.easy as int) - (leetcodeProfile.easy as int)) * 5;
  double add_medium =
      ((challengeAndUser.medium as int) - (leetcodeProfile.medium as int)) * 10;
  double add_hard =
      ((challengeAndUser.medium as int) - (leetcodeProfile.medium as int)) * 15;

  double totalRaise = add_easy + add_medium + add_hard;
  await FirebaseFirestore.instance
      .collection("challengeanduser")
      .where("userID", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .where("challengeID", isEqualTo: challengeAndUser.challengeID)
      .get()
      .then((value) => {
            FirebaseFirestore.instance
                .collection("challengeanduser")
                .doc(value.docs[0].id)
                .update({
              "easy": leetcodeProfile.easy,
              "medium": leetcodeProfile.medium,
              "hard": leetcodeProfile.hard,
              "currentryRaised": (challengeAndUser.currentryRaised as double) +
                  (add_easy as double) +
                  (add_medium as double) +
                  (add_hard as double),
            })
          });
  updateChallengeRaised(challengeAndUser.challengeID ?? "", totalRaise);
  updateUserHelpTotal(totalRaise);
}

Future updateChallengeRaised(String challengeID, double amount) async {
  await FirebaseFirestore.instance
      .collection("challenges")
      .doc(challengeID)
      .update({
    "currentlyRaised": FieldValue.increment(amount),
  });
}

// write a function to update the user's help total
Future updateUserHelpTotal(double amount) async {
  await FirebaseFirestore.instance
      .collection("users")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .update({
    "helpTotal": FieldValue.increment(amount),
  });
}

//write a function to update challengeAndUser's currentlyraised
Future updateChallengeAndUserRaised(String challengeID, double amount) async {
  await FirebaseFirestore.instance
      .collection("challengeanduser")
      .where("userID", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .where("challengeID", isEqualTo: challengeID)
      .get()
      .then((value) => {
            FirebaseFirestore.instance
                .collection("challengeanduser")
                .doc(value.docs[0].id)
                .update({
              "currentryRaised": FieldValue.increment(amount),
            })
          });
}
