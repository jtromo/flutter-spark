import 'package:flutter/material.dart';
import 'package:flutter_spark/utils/utils.dart';

class AnimationData {
  final Color color;
  final MaterialColor materialColor;
  final double opactiy;
  final double borderRadius;
  final double margin;
  final Duration duration;
  final Curve curve;

  AnimationData({
    required this.color,
    required this.materialColor,
    required this.opactiy,
    required this.borderRadius,
    required this.margin,
    required this.duration,
    required this.curve,
  });
  AnimationData.defaultData()
    : this(
        color: Colors.cyan,
        materialColor: Colors.primaries[0],
        opactiy: 1,
        borderRadius: 2,
        margin: 5,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOutBack,
      );

  AnimationData.random()
    : this(
        color: Utils.randomColor(),
        materialColor: Utils.randomMaterialColor(),
        opactiy: Utils.randomOpacity(),
        borderRadius: Utils.randomBorderRadius(),
        margin: Utils.randomMargin(),
        duration: Utils.randomDuration(),
        curve: Utils.randomCurve(),
      );
}
