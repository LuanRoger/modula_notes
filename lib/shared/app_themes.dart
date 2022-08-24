import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData lightThemeData = ThemeData(
    useMaterial3: true,
  );
  static ThemeData darkThemeData =
      ThemeData.dark().copyWith(useMaterial3: true);
}
