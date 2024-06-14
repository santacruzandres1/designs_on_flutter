import 'package:flutter/material.dart';

import '../widgets.dart';

class SlideShowWidget extends StatelessWidget {
  const SlideShowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _childrenInBodyBuilderSlideShow(),
          _childrenInBodyBuilderDots(),
        ],
      ),
    );
  }

  Widget _childrenInBodyBuilderSlideShow() {
    return const Expanded(
      child: SlideShow());
  }

  Widget _childrenInBodyBuilderDots() {
    return const Dots();
  }
}