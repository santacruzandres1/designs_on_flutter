import 'package:flutter/material.dart';

class AppTheme{
  ThemeData getTheme(){
    const  seedColor = Color.fromARGB(255, 90, 171, 135);




    return ThemeData(
      colorSchemeSeed: seedColor,
    );
  }
}