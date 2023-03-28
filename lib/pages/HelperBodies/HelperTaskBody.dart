import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:keti_zuka/pages/HelperBodies/ChallengeDescription.dart';

import '../../DatabaseModels/Challenge.dart';
import '../../constants.dart';

class HelperTaskBody extends StatefulWidget {
  const HelperTaskBody({super.key});

  @override
  State<HelperTaskBody> createState() => _HelperTaskBodyState();
}

Widget challengeItem(String name, String challengeType, String challengeID,
    BuildContext context) {
  return Center(
    child: GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChallengeDescription(
              challengeID: challengeID,
            ),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        height: 100,
        color: Colors.transparent,
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
                    //select first 40 characters if the name is longer than 40
                    name.length > 30 ? '${name.substring(0, 30)}..' : name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    challengeType,
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

class _HelperTaskBodyState extends State<HelperTaskBody> {
  List<Challenge> listOfChallenges = [];
  List<String> listOfChallengeIDs = [];
  Future getChallengeDataList() async {
    var data = await FirebaseFirestore.instance
        .collection("challenges")
        .limit(10)
        .get();

    setState(() {
      listOfChallenges =
          List.from(data.docs.map((doc) => Challenge.fromSnapshot(doc)));
      listOfChallengeIDs = List.from(data.docs.map((doc) => doc.id));
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getChallengeDataList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: mainOrangeColor,
      child: Stack(
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
          ),
          Padding(
            padding: const EdgeInsets.only(top: topOffsett),
            child: Center(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 30, top: topOffsett),
                    child: Text(
                      "CHALLENGES",
                      style: TextStyle(fontSize: 50),
                    ),
                  ),
                  Container(
                    width: 306,
                    height: 170,
                    decoration: const BoxDecoration(
                      color: mainOrangeColor,
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
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
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
                            String charityName =
                                listOfChallenges[index].charityName ??
                                    "Is null";

                            String typeOfChallenge =
                                listOfChallenges[index].challengeType ??
                                    "Is null";
                            String challengeID =
                                listOfChallengeIDs[index] ?? "Is null";
                            return challengeItem(charityName, typeOfChallenge,
                                challengeID, context);
                          },
                        ),
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
