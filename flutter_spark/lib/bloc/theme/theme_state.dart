import 'package:flutter/material.dart';
import 'package:flutter_spark/utils/constants.dart';
import 'package:equatable/equatable.dart';

@immutable
sealed class ThemeState extends Equatable {
  late final ThemeData theme;

  ThemeState({ThemeData? theme}) {
    if (theme == null) {
      this.theme = defaultTheme;
    } else {
      this.theme = theme;
    }
  }

  @override
  List<Object> get props => [theme.hashCode];
}

final class ThemeInitial extends ThemeState {
  ThemeInitial();
}

final class ThemeStateUpdated extends ThemeState {
  ThemeStateUpdated({required super.theme});
}
