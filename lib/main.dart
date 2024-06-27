import 'package:design_application/config/size/size_config.dart';
import 'package:design_application/src/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:design_application/config/theme/app_theme.dart';

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
      home: Builder(
        builder: (context){
          SizeConfig().init(context);
          return  const Page1Page();
        }),
    );
  }


}
