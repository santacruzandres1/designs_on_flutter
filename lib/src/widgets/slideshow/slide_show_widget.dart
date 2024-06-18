// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../widgets.dart';

// class SlideShowWidget extends StatelessWidget {
//   const SlideShowWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => SliderModel() ,
//       child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             _childrenInBodyBuilderSlideShow(),
//             _childrenInBodyBuilderDots(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _childrenInBodyBuilderSlideShow() {
//     return const Expanded(
//       child: SlideShow());
//   }

//   Widget _childrenInBodyBuilderDots() {
//     return const Dots();
//   }
// }

// class SliderModel with ChangeNotifier {

// double _currentPage = 0;

//   double get currentPage => _currentPage;

//   set currentPage (double currentPage){
//     _currentPage = currentPage;
//     notifyListeners();
//   }
  

// }