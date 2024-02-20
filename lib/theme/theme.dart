import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade900,
    brightness: Brightness.dark,
    primary: Colors.grey.shade900,
    secondary: Colors.grey.shade600,
  ),
);
ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade200,
    brightness: Brightness.light,
    primary: Colors.grey.shade200,
    secondary: Colors.grey.shade400,
  ),
);
