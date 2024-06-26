//
// import 'package:expense_app_wscube/presentation/pages/home_page.dart';
// import 'package:flutter/material.dart';
//
// class SplashScreen extends StatefulWidget {
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
// /*
//   @override
//   void initState() {
//     super.initState();
//     Timer(const Duration(seconds: 3), () {
//       Navigator.pushReplacement(
//           context, MaterialPageRoute(builder: (context) => HomePage()));
//     });
//   }
// */
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 31.0, horizontal: 21),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const SizedBox(height: 21),
//             Text(
//               'Monety',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   fontSize: 25,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.blueGrey.shade800,
//                   letterSpacing: 0.7),
//             ),
//             const SizedBox(height: 51),
//             Image.asset(
//               'assets/images/splash_logo.png',
//               width: 400,
//               height: 400,
//               fit: BoxFit.fill,
//             ),
//             const SizedBox(height: 31),
//             Text(
//               'Easy way to monitor\t\nyour expense',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   fontSize: 25,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.blueGrey.shade800,
//                   letterSpacing: 0.5),
//             ),
//             const SizedBox(height: 11),
//             const Text(
//               'Safe your future by managing your\t\nexpense right now',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   fontSize: 17,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black45,
//                   letterSpacing: 0.5),
//             ),
//             Align(
//               alignment: Alignment.bottomRight,
//               child: InkWell(
//                 onTap: () {
//                   Navigator.pushReplacement(context,
//                       MaterialPageRoute(builder: (context) => HomePage()));
//                 },
//                 child: Container(
//                   height: 50,
//                   width: 50,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                       boxShadow: const [
//                         BoxShadow(color: Colors.white, offset: Offset(-8, -8)),
//                       ],
//                       color: Colors.pink.shade200),
//                   child: const Icon(
//                     Icons.arrow_forward_sharp,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
