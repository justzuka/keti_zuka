import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:keti_zuka/DatabaseModels/Challenge.dart';

import '../../DatabaseModels/MyUser.dart';
import '../../FirebaseStuff.dart';
import '../../constants.dart';

class DonorHomeBody extends StatefulWidget {
  const DonorHomeBody({super.key});

  @override
  State<DonorHomeBody> createState() => _DonorHomeBodyState();
}

Widget charityChallengeCurrentFinal(String charity, String challenge,
    String currentRaised, String finalRaised) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: mainOrangeColor),
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        height: 100,
        child: Padding(
          padding: const EdgeInsets.only(left: 40, top: 10, bottom: 10),
          child: Row(children: [
            Container(
              width: 50,
              height: 50,
              color: const Color.fromARGB(255, 210, 210, 210),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    charity,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    challenge,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    currentRaised,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    finalRaised,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    ),
  );
}

class _DonorHomeBodyState extends State<DonorHomeBody> {
  List<Challenge> listOfChallenges = [];
  MyUser myuser = MyUser();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getUserChallengeList();
    getCurrentUser();
  }

  Future getCurrentUser() async {
    getCurrentUserData().then((value) {
      setState(() {
        myuser = value;
      });
    });
  }

  Future getUserChallengeList() async {
    var data = await FirebaseFirestore.instance
        .collection("challenges")
        .where('ownerID', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where('finished', isEqualTo: false)
        //.limit(10)
        .get();

    setState(() {
      listOfChallenges =
          List.from(data.docs.map((doc) => Challenge.fromSnapshot(doc)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 225 + topOffsett,
            decoration: const BoxDecoration(
              color: mainOrangeColor,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(40.0),
                  bottomLeft: Radius.circular(40.0)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: topOffsett),
            child: Center(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 100),
                    child: Text(
                      "Hello Donor",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 21,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Container(
                      width: 306,
                      height: 122,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(33, 0, 0, 0),
                            blurRadius: 10.0,
                            spreadRadius: 0.1,
                            offset:
                                Offset(0, 10), // shadow direction: bottom right
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "Total Donated",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 21,
                              ),
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    child: SvgPicture.asset(coinSvg),
                                  ),
                                  Text(
                                    myuser.donorTotal == null
                                        ? "Loading"
                                        : "\$" +
                                            //sheaswore
                                            (myuser.donorTotal ?? 0)
                                                .toStringAsFixed(3),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 22,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ]),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Text(
                      "Your Created Challenges/Donations",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 21,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      color: Colors.transparent,
                      alignment: Alignment.topLeft,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listOfChallenges.length,
                        itemBuilder: (BuildContext context, int index) {
                          String charity =
                              listOfChallenges[index].charityName ?? "Is null";

                          String challenge =
                              listOfChallenges[index].challengeType ??
                                  "Is null";
                          double currentlyRaised =
                              listOfChallenges[index].currentlyRaised ?? 0;
                          double finalRaised =
                              listOfChallenges[index].approxAmount ?? 0;
                          print("$index");
                          return charityChallengeCurrentFinal(
                              charity,
                              challenge,
                              "Currently Raised: \$" +
                                  currentlyRaised.toString(),
                              "Goal: \$" + finalRaised.toString());

                          // return Text(email);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
