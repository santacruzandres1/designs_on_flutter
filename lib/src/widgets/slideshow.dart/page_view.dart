import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideShow extends StatelessWidget {
  const SlideShow({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: const <Widget>[
        _Slide('assets/svgs/slide-1.svg'),
        _Slide('assets/svgs/slide-2.svg'),
        _Slide('assets/svgs/slide-3.svg'),
      ],
    );
  }
}

class _Slide extends StatelessWidget {
  final String svg;

  const _Slide(this.svg);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30),
      child: SvgPicture.asset(svg),
    );
  }
}
