import 'package:flutter/material.dart';

class AppTheme{
  ThemeData getTheme(){
    const  seedColor = Color.fromARGB(255, 223, 84, 119);


    return ThemeData(
      colorSchemeSeed: seedColor,
    );
  }
}