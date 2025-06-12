import 'package:flutter/material.dart';
import 'package:flutter_spark/models/animation_data.dart';

enum StateManager {
  state,
  bloc,
  cubit;

  static StateManager fromString(String? managerString) {
    if (managerString == null) {
      return StateManager.state;
    }
    if (managerString == StateManager.state.toString()) {
      return StateManager.state;
    } else if (managerString == StateManager.bloc.toString()) {
      return StateManager.bloc;
    } else if (managerString == StateManager.cubit.toString()) {
      return StateManager.cubit;
    } else {
      return StateManager.state;
    }
  }

  @override
  String toString() {
    switch (this) {
      case StateManager.state:
        return "State";
      case StateManager.bloc:
        return "BLoC";
      case StateManager.cubit:
        return "Cubit";
    }
  }
}

const defaultSeedColor = Colors.cyan;

final defaultTheme = ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: defaultSeedColor), useMaterial3: true);

final defaultAnimationData = AnimationData.defaultData();

final defaultDarkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSeed(seedColor: defaultSeedColor),
  useMaterial3: true,
);

final defaultLightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSeed(seedColor: defaultSeedColor),
  useMaterial3: true,
);

const owlJpgUrl = 'https://raw.githubusercontent.com/flutter/website/main/src/content/assets/images/docs/owl.jpg';

// ignore: non_constant_identifier_names
final CurvesList = [
  Curves.linear,
  Curves.ease,
  Curves.easeIn,
  Curves.easeOut,
  Curves.easeInOut,
  Curves.bounceIn,
  Curves.bounceOut,
  Curves.elasticIn,
  Curves.elasticOut,
  Curves.fastLinearToSlowEaseIn,
  Curves.fastOutSlowIn,
  Curves.linearToEaseOut,
  Curves.slowMiddle,
];
