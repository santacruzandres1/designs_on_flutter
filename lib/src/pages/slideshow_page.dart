import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:design_application/src/widgets/slideshow.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomSlideshow(),
    );
  }
}

class CustomSlideshow extends StatelessWidget {
  const CustomSlideshow({super.key});

  @override
  Widget build(BuildContext context) {
    return Slideshow(
      // dotsAbove: true,
      // primaryColor: Colors.green,
      // secondaryColor: Colors.grey,
      // bulletPrimario: 20,
      // bulletSecundario: 5,
      slides: <Widget>[
        SvgPicture.asset('assets/svgs/slide-1.svg'),
        SvgPicture.asset('assets/svgs/slide-2.svg'),
        SvgPicture.asset('assets/svgs/slide-3.svg'),
        SvgPicture.asset('assets/svgs/slide-4.svg'),
        SvgPicture.asset('assets/svgs/slide-5.svg'),
      ],
    );
  }
}
