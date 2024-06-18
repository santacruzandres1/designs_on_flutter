


// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../models/slider_model.dart';

// class Dots extends StatelessWidget {
//   const Dots({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return const SizedBox(
//       width: double.infinity,
//       height: 70,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           _Dot(0),
//           _Dot(1),
//           _Dot(2),
//         ],
//       ),
//     );
//   }
// }

// class _Dot extends StatelessWidget {

//   final int index;

//   const _Dot(this.index);

//   @override
//   Widget build(BuildContext context) {

//     final pageViewIndex = Provider.of<SliderModel>(context).currentPage;

//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 200),
//       width: 12,
//       height: 12,
//       margin: const EdgeInsets.symmetric(horizontal: 5),
//       decoration: BoxDecoration(
//         color:  ( pageViewIndex >= index - 0.5 && 
//                   pageViewIndex < index + 0.5)
//                     ?Colors.green
//                     :Colors.grey,
//         shape: BoxShape.circle,
//       ),
//     );
//   }
// }