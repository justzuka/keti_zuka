import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:keti_zuka/DatabaseModels/MyUser.dart';
import 'package:keti_zuka/FirebaseStuff.dart';

import '../../constants.dart';

class HelperHomeBody extends StatefulWidget {
  const HelperHomeBody({super.key});

  @override
  State<HelperHomeBody> createState() => _HelperHomeBodyState();
}

Widget userNameMoneyEarned(String name, String money) {
  return Center(
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
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                Text(
                  money,
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
  );
}

class _HelperHomeBodyState extends State<HelperHomeBody> {
  List<MyUser> listOfUsers = [];
  MyUser? userInfo = null;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getUserDataList();
    getCurrentUser();
  }

  Future getCurrentUser() async {
    userInfo = await getCurrentUserData();
  }

  Future getUserDataList() async {
    var data = await FirebaseFirestore.instance
        .collection("users")
        .orderBy("helpTotal", descending: true)
        .limit(10)
        .get();

    setState(() {
      listOfUsers = List.from(data.docs.map((doc) => MyUser.fromSnapshot(doc)));
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
                  Padding(
                    padding: const EdgeInsets.only(right: 100),
                    child: Stack(children: [
                      SvgPicture.asset(helperHomeSvg),
                    ]),
                  ),
                  Container(
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
                            "Total Earned",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 22,
                              letterSpacing: 1,
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
                                  userInfo == null
                                      ? "Loading"
                                      : "\$" +
                                          (userInfo?.helpTotal ?? 0)
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
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "Leader Board",
                      style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
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
                        itemCount: listOfUsers.length,
                        itemBuilder: (BuildContext context, int index) {
                          String email = listOfUsers[index].email ?? "Is null";

                          double helpTotal = listOfUsers[index].helpTotal ?? -1;
                          print("$index");
                          return userNameMoneyEarned(
                              email, helpTotal.toStringAsFixed(3) + "\$");

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
