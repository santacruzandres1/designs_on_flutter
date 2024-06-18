
// import 'package:design_application/src/widgets/slideshow.dart/slide_show_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:provider/provider.dart';

// class SlideShow extends StatefulWidget {
//   const SlideShow({super.key});

//   @override
//   State<SlideShow> createState() => _SlideShowState();
// }

// class _SlideShowState extends State<SlideShow> {
  
//   final pageViewController = PageController();

// @override
//   void initState() {
//     pageViewController.addListener((){

//       //ACtualizaqr el provider, sliderModel
//       Provider.of<SliderModel>(context, listen: false).currentPage = pageViewController.page!;
    
//     });
//     super.initState();
//   }

//   @override
//   void dispose() {
//     pageViewController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return PageView(
//       controller: pageViewController,
//       children: const <Widget>[
//         _Slide('assets/svgs/slide-1.svg'),
//         _Slide('assets/svgs/slide-2.svg'),
//         _Slide('assets/svgs/slide-3.svg'),
//       ],
//     );
//   }
// }

// class _Slide extends StatelessWidget {
//   final String svg;

//   const _Slide(this.svg);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: double.infinity,
//       padding: const EdgeInsets.all(30),
//       child: SvgPicture.asset(svg),
//     );
//   }
// }
