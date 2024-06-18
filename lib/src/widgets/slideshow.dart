import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool dotsAbove;
  final Color? primaryColor;
  final Color? secondaryColor;

  const Slideshow({
    super.key,
    required this.slides,
    this.dotsAbove = false,
    this.primaryColor,
    this.secondaryColor,
  });

  @override
  Widget build(BuildContext context) {
    final themeColors = Theme.of(context).colorScheme;

    return ChangeNotifierProvider.value(
      value: _SlideshowModel(
        primaryColor: primaryColor ?? themeColors.primary,
        secondaryColor: secondaryColor ?? themeColors.secondary,
      ),
      child: SafeArea(
        child: Column(
          children: [
            if (dotsAbove) _Dots(slides.length),
            Expanded(
              child: _Slides(slides: slides),
            ),
            if (!dotsAbove) _Dots(slides.length),
          ],
        ),
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  const _Slides({required this.slides});

  @override
  _SlidesState createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  late PageController pageViewController;
  late _SlideshowModel ssModel;

  @override
  void initState() {
    super.initState();
    ssModel = Provider.of<_SlideshowModel>(context, listen: false);
    pageViewController = PageController();

    pageViewController.addListener(() {
      ssModel.currentPage = pageViewController.page!;
    });

    ssModel.addListener(_onModelUpdated);
  }

  @override
  void dispose() {
    pageViewController.dispose();
    ssModel.removeListener(_onModelUpdated);
    super.dispose();
  }

  void _onModelUpdated() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageViewController,
      children: widget.slides.map((slide) => _Slide(slide)).toList(),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  const _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30),
      child: slide,
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlides;

  const _Dots(this.totalSlides);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(totalSlides, (i) => _Dot(i)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  const _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final ssModel = Provider.of<_SlideshowModel>(context);

    final Color colorDots = (ssModel.currentPage >= index - 0.5 &&
            ssModel.currentPage < index + 0.5)
        ? ssModel.primaryColor
        : ssModel.secondaryColor;

    final double sizeDots = (ssModel.currentPage >= index - 0.5 &&
            ssModel.currentPage < index + 0.5)
        ? 16
        : 12;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: sizeDots,
      height: sizeDots,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: colorDots,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _SlideshowModel with ChangeNotifier {
  double _currentPage = 0;
  Color _primaryColor;
  Color _secondaryColor;

  _SlideshowModel({
    required Color primaryColor,
    required Color secondaryColor,
  })  : _primaryColor = primaryColor,
        _secondaryColor = secondaryColor;

  double get currentPage => _currentPage;

  set currentPage(double value) {
    _currentPage = value;
    notifyListeners();
  }

  Color get primaryColor => _primaryColor;
  Color get secondaryColor => _secondaryColor;

  void updateColors(
      {required Color primaryColor, required Color secondaryColor}) {
    _primaryColor = primaryColor;
    _secondaryColor = secondaryColor;
    notifyListeners();
  }
}
