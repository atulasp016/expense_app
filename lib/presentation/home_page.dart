// import 'package:expense_app_wscube/domain/ui_helper/ui_helper.dart';
// import 'package:expense_app_wscube/domain/utils/app_colors.dart';
// import 'package:expense_app_wscube/domain/utils/app_images.dart';
// import 'package:flutter/material.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(21),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 21),
//                 CTextWidget(
//                   cText: 'Hello,\tAtul',
//                   cTextStyle: TextStyle(
//                     color: ColorsConstant.secondaryblack_Color,
//                   ),
//                 ),
//                 CommonTIcon(
//                   title: 'Home',
//                   image: ImageConstant.profile_img,
//                 ),
//                 const SizedBox(height: 21),
//                 Container(
//                   padding: const EdgeInsets.all(21),
//                   decoration: BoxDecoration(
//                       color: ColorsConstant.primary_Color,
//                       borderRadius: BorderRadius.circular(24)),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           CTextWidget(
//                             cText: 'My Balance',
//                             cTextStyle: TextStyle(
//                               color: ColorsConstant.white_Color,
//                             ),
//                           ),
//                           CTextWidget(
//                             cText: '\$25,520',
//                             cTextStyle: TextStyle(
//                               color: ColorsConstant.white_Color,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 34,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Align(
//                           alignment: Alignment.centerRight,
//                           child: IconButton(
//                               onPressed: () {},
//                               icon: Icon(
//                                 Icons.arrow_forward_ios_sharp,
//                                 color: ColorsConstant.white_Color,
//                               ))),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 21),
//                 Container(
//                   height: 245,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                       color: const Color(0xffAF52DE),
//                       borderRadius: BorderRadius.circular(24)),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 21.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 CTextWidget(
//                   cText: 'Wallet',
//                   cTextStyle: TextStyle(
//                     color: ColorsConstant.secondaryblack_Color,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 22,
//                   ),
//                 ),
//                 TextButton(
//                     onPressed: () {},
//                     child: Text(
//                       'See all',
//                       style: TextStyle(
//                         color: ColorsConstant.primary_Color,
//                         fontWeight: FontWeight.w400,
//                         fontSize: 15,
//                       ),
//                     ))
//               ],
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: 12,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     leading: CircleAvatar(
//                       backgroundColor: ColorsConstant.mainText_Color,
//                       radius: 25,
//                     ),
//                     title: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         FittedBox(
//                           child: Text(
//                             'Nike Air Max 2090',
//                             style: TextStyle(
//                               color: ColorsConstant.black_Color,
//                               fontWeight: FontWeight.w500,
//                               fontSize: 17,
//                             ),
//                           ),
//                         ),
//                         FittedBox(
//                           child: Text(
//                             '-\$243.00',
//                             textAlign: TextAlign.start,
//                             style: TextStyle(
//                               color: ColorsConstant.black_Color,
//                               fontWeight: FontWeight.w500,
//                               fontSize: 17,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     subtitle: Text(
//                       '15 Aug 2020',
//                       style: TextStyle(
//                         color: ColorsConstant.mainText_Color,
//                         fontWeight: FontWeight.w300,
//                         fontSize: 15,
//                       ),
//                     ),
//                   );
//                 }),
//           )
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: ColorsConstant.primary_Color,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(40),
//         ),
//         elevation: 7,
//         onPressed: () {},
//         child: Icon(
//           Icons.add,
//           size: 30,
//           color: ColorsConstant.white_Color,
//         ),
//       ),
//     );
//   }
// }
