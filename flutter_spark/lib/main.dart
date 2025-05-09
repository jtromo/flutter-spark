import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spark/app.dart';
import 'package:flutter_spark/bloc/global_bloc_observer.dart';

void main() {
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Material(
      child: Container(
        color: Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(details.exception.toString())],
        ),
      ),
    );
  };

  Bloc.observer = GlobalBlocObserver();
  runApp(const App());
}
