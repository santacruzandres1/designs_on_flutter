import 'package:design_application/config/theme/app_theme.dart';
import 'package:design_application/src/pages/slideshow_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme().getTheme(),
      debugShowCheckedModeBanner: false,
      home: const SlideshowPage(),
    );
  }
}
