// import 'package:flutter/material.dart';
// import 'package:keti_zuka/pages/IndDonorLogin.dart';
// import 'package:keti_zuka/pages/IndDonorSignup.dart';

// class IndDonorSignLoginScreen extends StatefulWidget {
//   const IndDonorSignLoginScreen({super.key});

//   @override
//   State<IndDonorSignLoginScreen> createState() =>
//       _IndDonorSignLoginScreenState();
// }

// class _IndDonorSignLoginScreenState extends State<IndDonorSignLoginScreen> {
//   void toggleIndex() {
//     setState(() {
//       isLogin = !isLogin;
//     });
//   }

//   bool isLogin = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         shadowColor: Colors.transparent,
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//       ),
//       body: isLogin
//           ? IndDonorLogin(
//               toggleIndex: toggleIndex,
//             )
//           : IndDonorSignup(
//               toggleIndex: toggleIndex,
//             ),
//     );
//   }
// }
