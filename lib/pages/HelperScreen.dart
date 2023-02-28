import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keti_zuka/constants.dart';
import 'package:keti_zuka/my_icons_icons.dart';
import 'package:keti_zuka/pages/HelperBodies/HelperHomeBody.dart';
import 'package:keti_zuka/pages/HelperBodies/HelperTaskBody.dart';

class HelperScreen extends StatefulWidget {
  const HelperScreen({super.key});

  @override
  State<HelperScreen> createState() => _HelperScreenState();
}

class _HelperScreenState extends State<HelperScreen> {
  int _currentIndex = 0;

  final screens = const [
    HelperHomeBody(),
    HelperTaskBody(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedItemColor: mainOrangeColor,
        iconSize: 40,
        unselectedIconTheme:
            const IconThemeData(color: Color.fromARGB(31, 0, 0, 0)),
        selectedIconTheme: const IconThemeData(size: 50),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(MyIcons.home),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Icon(MyIcons.tasks),
            label: "challenges",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "settings",
          )
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
