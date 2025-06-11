import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spark/bloc/theme/theme_cubit.dart';
import 'package:flutter_spark/bloc/theme/theme_state.dart';
import 'package:flutter_spark/utils/constants.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ThemeData theme;
  group('ThemeCubit', () {
    setUp(() {
      theme = defaultTheme;
    });

    blocTest(
      'should emit ThemeInitial when no events are added',
      build: () => ThemeCubit(),
      expect: () => [],
    );

    blocTest(
      'should emit ThemeInitial when reset is called',
      build: () => ThemeCubit(),
      act: (cubit) => cubit.reset(),
      expect: () => [ThemeInitial()],
    );

    blocTest(
      'should change theme',
      build: () => ThemeCubit(),
      act: (cubit) {
        cubit.changeTheme(theme);
      },
      expect: () => [
        ThemeStateUpdated(theme: theme),
      ],
    );
  });
}
