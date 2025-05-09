// ignore_for_file: unused_import

import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spark/bloc/theme/theme_cubit.dart';
import 'package:flutter_spark/bloc/theme/theme_state.dart';
import 'package:flutter_spark/common/spark_drawer.dart';

class ThemePage extends StatefulWidget {
  const ThemePage({super.key, this.title = 'Theme Page'});

  final String title;

  @override
  State<ThemePage> createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
  late ThemeCubit _themeCubit;

  @override
  void initState() {
    super.initState();
    _themeCubit = context.read<ThemeCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: const SparkDrawer(),
      body: MultiBlocListener(
        listeners: [
          BlocListener<ThemeCubit, ThemeState>(
            listener: (context, state) {
              if (kDebugMode) {
                log("Theme changed");
              }
            },
          ),
        ],
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Theme',
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: "random theme",
            onPressed: _themeCubit.randomTheme,
            tooltip: 'Random Theme',
            child: const Icon(Icons.palette),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "reset theme",
            onPressed: _themeCubit.reset,
            tooltip: 'Reset Theme',
            child: const Icon(Icons.refresh),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
