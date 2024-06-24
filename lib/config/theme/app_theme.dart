import 'package:flutter/material.dart';

class AppTheme{
  ThemeData getTheme(){
    const  seedColor = Colors.blue;


    return ThemeData(
      colorSchemeSeed: seedColor,
    );
  }
}