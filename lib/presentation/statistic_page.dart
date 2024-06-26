// import 'package:expense_app_wscube/domain/widgets/dropdownButton.dart';
// import 'package:flutter/material.dart';
//
// class StatisticPage extends StatefulWidget {
//   const StatisticPage({super.key});
//
//   @override
//   State<StatisticPage> createState() => _StatisticPageState();
// }
//
// class _StatisticPageState extends State<StatisticPage> {
//   final List<String> items = [
//     'Item1',
//     'Item2',
//     'Item3',
//     'Item4',
//   ];
//
//   String? selectedValue;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(21.0),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Text(
//                   'Statistic',
//                   style: TextStyle(
//                     fontSize: 22,
//                     fontWeight: FontWeight.w800,
//                     color: Colors.blueGrey.shade800,
//                   ),
//                 ),
//                 DropdownWidget(
//                     items: items,
//                     selectedValue: selectedValue,
//                     onTap: (String value) {
//                       setState(() {
//                         selectedValue = value;
//                       });
//                     }),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
