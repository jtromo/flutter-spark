import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_spark/utils/constants.dart';

class Utils {
  static final _random = Random();

  // static Color randomColor() {
  //   return Color.fromARGB(255, _random.nextInt(256), _random.nextInt(256), _random.nextInt(256));
  // }

  static Color randomColor() {
    return Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
  }

  static double randomBorderRadius() {
    return _random.nextDouble() * 64;
  }

  static double randomMargin() {
    return _random.nextDouble() * 64;
  }

  static Duration randomDuration() {
    return Duration(milliseconds: _random.nextInt(1000) * 400);
  }

  static double randomOpacity() {
    return _random.nextDouble() * 1.0;
  }

  static MaterialColor randomMaterialColor() {
    return Colors.primaries[_random.nextInt(Colors.primaries.length)];
  }

  static Curve randomCurve() {
    return CurvesList[_random.nextInt(CurvesList.length)];
  }

  static ThemeData generateRandomTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: randomColor()),
      scaffoldBackgroundColor: randomColor(),
      appBarTheme: AppBarTheme(backgroundColor: randomColor(), foregroundColor: randomColor()),
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
