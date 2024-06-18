import 'package:flutter/material.dart';

class AppTheme{
  ThemeData getTheme(){
    const  seedColor = Color(0xffF6577F);


    return ThemeData(
      colorSchemeSeed: seedColor,
    );
  }
}