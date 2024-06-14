
import 'package:design_application/config/theme/app_theme.dart';
import 'package:design_application/src/pages/pages.dart';
import 'package:flutter/material.dart';

// import 'src/challenges/challenges.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: AppTheme().getTheme(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _bodyBuilder(context),
      ),
    );
  }

  Widget _bodyBuilder(BuildContext context){

    return const GraficasCircularesPage();
  }
}
