import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spark/bloc/theme/theme_state.dart';
import 'package:flutter_spark/utils/utils.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  void changeTheme(ThemeData theme) => emit(ThemeStateUpdated(theme: theme));
  void randomTheme() => emit(ThemeStateUpdated(theme: Utils.generateRandomTheme()));
  void reset() => emit(ThemeInitial());
}
