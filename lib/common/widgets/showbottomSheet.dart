// import 'package:flutter/material.dart';

// class ShowBottomSheet extends StatefulWidget {
//   const ShowBottomSheet({super.key});

//   @override
//   State<ShowBottomSheet> createState() => _ShowBottomSheetState();
// }

// class _ShowBottomSheetState extends State<ShowBottomSheet> {
//   Future bottomModal(BuildContext context) {
//     return showModalBottomSheet(
//         isScrollControlled: true,
//         shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
//         context: context,
//         builder: (context) {
//           return Padding(
//             padding: MediaQuery.of(context).viewInsets,
//             child: DefaultTabController(
//               length: 3,
//               initialIndex: 0,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   const TabBar(
//                     labelColor: Colors.red,
//                     tabs: <Widget>[
//                       Tab(text: 'Overview'),
//                       Tab(text: 'Rating&Review'),
//                       Tab(text: 'Details')
//                     ],
//                   ),
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height /
//                         2, //I want to use dynamic height instead of fixed height
//                     child: const TabBarView(
//                       children: <Widget>[
//                         Column(
//                           children: <Widget>[],
//                         ),
//                         Column(
//                           children: <Widget>[],
//                         ),
//                         Column(
//                           children: <Widget>[],
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           );
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => bottomModal(context),
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

// void showCustomBottomSheet({
//   required BuildContext context,
//   int initialTabIndex = 0,
//   required List<Widget> tabBarViews,
// }) {
//   showModalBottomSheet(
//     isScrollControlled: true,
//     shape: const RoundedRectangleBorder(
//       borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
//     ),
//     context: context,
//     builder: (context) {
//       return Padding(
//         padding: MediaQuery.of(context).viewInsets,
//         child: DefaultTabController(
//           length: 3,
//           initialIndex: initialTabIndex,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               const TabBar(
//                 labelColor: Colors.red,
//                 tabs: <Widget>[
//                   Tab(text: 'Overview'),
//                   Tab(text: 'Rating & Review'),
//                   Tab(text: 'Details'),
//                 ],
//               ),
//               Flexible(
//                 child: TabBarView(
//                   children: tabBarViews,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }
