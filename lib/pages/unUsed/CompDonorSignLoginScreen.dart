// import 'package:flutter/material.dart';
// import 'package:keti_zuka/pages/CompDonorLogin.dart';
// import 'package:keti_zuka/pages/CompDonorSignup.dart';

// class CompDonorSignLoginScreen extends StatefulWidget {
//   const CompDonorSignLoginScreen({super.key});

//   @override
//   State<CompDonorSignLoginScreen> createState() =>
//       _CompDonorSignLoginScreenState();
// }

// class _CompDonorSignLoginScreenState extends State<CompDonorSignLoginScreen> {
//   void toggleIndex() {
//     setState(() {
//       isLogin = !isLogin;
//     });
//   }

//   bool isLogin = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         resizeToAvoidBottomInset: false,
//         extendBodyBehindAppBar: true,
//         appBar: AppBar(
//           shadowColor: Colors.transparent,
//           elevation: 0,
//           backgroundColor: Colors.transparent,
//         ),
//         body: isLogin
//             ? CompDonorLogin(
//                 toggleIndex: toggleIndex,
//               )
//             : CompDonorSignup(
//                 toggleIndex: toggleIndex,
//               ));
//   }
// }
