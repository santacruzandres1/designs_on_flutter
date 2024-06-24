import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class HeaderPage extends StatelessWidget {
  const HeaderPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: HeaderCurvo(),
      ),
    );
  }
}