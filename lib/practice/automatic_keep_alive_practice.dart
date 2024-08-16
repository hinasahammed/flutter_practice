// import 'package:flutter/material.dart';

// class AutomaticKeepAlivePractice extends StatefulWidget {
//   const AutomaticKeepAlivePractice({super.key});

//   @override
//   State<AutomaticKeepAlivePractice> createState() =>
//       _AutomaticKeepAlivePracticeState();
// }

// class _AutomaticKeepAlivePracticeState extends State<AutomaticKeepAlivePractice>
//     with AutomaticKeepAliveClientMixin<AutomaticKeepAlivePractice> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         appBar: AppBar(
//           bottom: const TabBar(
//             tabs: [
//               Tab(
//                 text: "One",
//               ),
//               Tab(
//                 text: "Two",
//               ),
//               Tab(
//                 text: "Three",
//               ),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             oneTabbarView(),
//             twoTabbarView(),
//             threeTabbarView(),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   bool get wantKeepAlive => true;
// }

// Widget oneTabbarView() {
//   return ListView.builder(
//     padding: const EdgeInsets.all(16),
//     itemCount: oneImages.length,
//     itemBuilder: (context, index) => Card(
//         margin: const EdgeInsets.only(top: 15, bottom: 5),
//         child: Container(
//           width: double.infinity,
//           height: 150,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15),
//             image: DecorationImage(
//               image: NetworkImage(
//                 oneImages[index],
//               ),
//               fit: BoxFit.cover,
//               opacity: .7,
//             ),
//           ),
//         )),
//   );
// }

// Widget twoTabbarView() {
//   return ListView.builder(
//     padding: const EdgeInsets.all(16),
//     itemCount: oneImages.length,
//     reverse: true,
//     itemBuilder: (context, index) => Card(
//         margin: const EdgeInsets.only(top: 15, bottom: 5),
//         child: Container(
//           width: double.infinity,
//           height: 150,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15),
//             image: DecorationImage(
//               image: NetworkImage(
//                 oneImages[index],
//               ),
//               fit: BoxFit.cover,
//               opacity: .7,
//             ),
//           ),
//         )),
//   );
// }

// Widget threeTabbarView() {
//   return ListView.builder(
//       padding: const EdgeInsets.all(16),
//       itemCount: oneImages.length,
//       itemBuilder: (context, index) {
//         oneImages.shuffle();
//         return Card(
//             margin: const EdgeInsets.only(top: 15, bottom: 5),
//             child: Container(
//               width: double.infinity,
//               height: 150,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15),
//                 image: DecorationImage(
//                   image: NetworkImage(
//                     oneImages[index],
//                   ),
//                   fit: BoxFit.cover,
//                   opacity: .7,
//                 ),
//               ),
//             ));
//       });
// }

// List oneImages = [
//   "https://i.pinimg.com/736x/42/a1/13/42a1139fc63047fab5b0d79e5935d80d.jpg",
//   "https://i.pinimg.com/564x/a7/ec/16/a7ec16ba8a388d359af2e236ebbbdcdf.jpg",
//   "https://i.pinimg.com/736x/34/bb/12/34bb1289e9e8e85413391b72188e4ad5.jpg",
//   "https://i.pinimg.com/564x/e8/19/0c/e8190c467ebfe6f5ce3838f7a9411305.jpg",
//   "https://i.pinimg.com/564x/91/46/93/914693dfd1d6325db01383567f8149ae.jpg",
//   "https://i.pinimg.com/564x/1b/d1/6a/1bd16ae7eaf97f51b218d462dbf7e5fd.jpg",
//   ""
// ];
