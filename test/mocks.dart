import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spark/bloc/counter/counter_cubit.dart';
import 'package:flutter_spark/bloc/theme/theme_cubit.dart';

Widget setupTestWidget(
  Widget page, {
  CounterCubit? counterCubit,
  ThemeCubit? themeCubit,
}) {
  counterCubit ??= CounterCubit();
  themeCubit ??= ThemeCubit();
  return Builder(builder: (BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterCubit>(
          create: (BuildContext context) => counterCubit!,
        ),
        BlocProvider<ThemeCubit>(
          create: (BuildContext context) => themeCubit!,
        ),
      ],
      child: MaterialApp(
        home: Scaffold(
          body: page,
        ),
      ),
    );
  });
}
