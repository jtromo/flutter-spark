import 'dart:math';
import 'package:flutter/material.dart';

class Utils {
  static final _random = Random();

  static Color randomColor() {
    return Color.fromARGB(
      255,
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
    );
  }

  static ThemeData generateRandomTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: randomColor()),
      scaffoldBackgroundColor: randomColor(),
      appBarTheme: AppBarTheme(
        backgroundColor: randomColor(),
        foregroundColor: randomColor(),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: randomColor(),
        foregroundColor: randomColor(),
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: randomColor()),
        bodyMedium: TextStyle(color: randomColor()),
        titleLarge: TextStyle(color: randomColor()),
      ),
    );
  }
}
