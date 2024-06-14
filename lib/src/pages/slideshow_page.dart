import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyBuilder(),
    );
  }

  Widget _bodyBuilder() {
    return const Center(
      child:SlideShowWidget(),
    );
  }

}
