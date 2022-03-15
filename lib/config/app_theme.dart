import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(brightness: Brightness.light, fontFamily: 'Comfortaa', useMaterial3: true);
  }

  static ThemeData get dark {
    return ThemeData(brightness: Brightness.dark, fontFamily: 'Comfortaa', useMaterial3: true);
  }
}
