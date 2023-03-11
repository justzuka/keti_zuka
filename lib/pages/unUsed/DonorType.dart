// // ignore: file_names
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:keti_zuka/components/MyTextFormField.dart';

// import 'package:keti_zuka/constants.dart';
// import 'package:keti_zuka/pages/CompDonorSignLoginScreen.dart';
// import 'package:keti_zuka/pages/IndDonorSignLoginScreen.dart';

// class DonorType extends StatelessWidget {
//   const DonorType({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         extendBodyBehindAppBar: true,
//         appBar: AppBar(
//           shadowColor: Colors.transparent,
//           elevation: 0,
//           backgroundColor: Colors.transparent,
//         ),
//         body: Container(
//           color: Colors.white,
//           child: Stack(children: [
//             Positioned(
//               left: -200,
//               top: -200,
//               child: SvgPicture.asset(
//                 orangeCircle,
//                 width: 420,
//               ),
//             ),
//             Positioned(
//               right: -200,
//               top: -200,
//               child: SvgPicture.asset(
//                 orangeCircle,
//                 width: 420,
//               ),
//             ),
//             Center(
//                 child: Container(
//               width: double.infinity,
//               height: 500,
//               color: Colors.transparent,
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 30, bottom: 30),
//                 child: Padding(
//                   padding: const EdgeInsets.only(
//                     top: 10,
//                     bottom: 10,
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Center(
//                         child: Padding(
//                           padding: EdgeInsets.only(top: 10, bottom: 10),
//                           child: Text(
//                             "YOU ARE",
//                             style: TextStyle(
//                               fontWeight: FontWeight.w400,
//                               fontSize: 50,
//                             ),
//                           ),
//                         ),
//                       ),
//                       Center(
//                         child: Padding(
//                           padding: const EdgeInsets.all(20),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               GestureDetector(
//                                 onTap: () {
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) =>
//                                               const CompDonorSignLoginScreen()));
//                                 },
//                                 child: Column(
//                                   children: [
//                                     SvgPicture.asset(companySvg),
//                                     const Text(
//                                       "Company",
//                                       style: TextStyle(
//                                           fontSize: 21, letterSpacing: 1.7),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               GestureDetector(
//                                 onTap: () {
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) =>
//                                               const IndDonorSignLoginScreen()));
//                                 },
//                                 child: Column(
//                                   children: [
//                                     SvgPicture.asset(indSvg),
//                                     const Text(
//                                       "Individual",
//                                       style: TextStyle(
//                                           fontSize: 21, letterSpacing: 1.7),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ))
//           ]),
//         ));
//   }
// }
