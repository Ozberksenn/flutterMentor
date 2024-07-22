import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = light;
  static ThemeData darkTheme = light;
}

ThemeData light = ThemeData(
    useMaterial3: true,
    colorSchemeSeed: Colors.blue,
    tabBarTheme: const TabBarTheme(
        dividerHeight: 0,
        dividerColor: Colors.black,
        indicatorColor: Colors.black,
        overlayColor: MaterialStatePropertyAll(Colors.transparent)));

ThemeData dark = ThemeData();
