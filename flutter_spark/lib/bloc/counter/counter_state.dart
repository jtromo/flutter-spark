import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
sealed class CounterState extends Equatable {
  final int count;
  const CounterState({this.count = 0});

  @override
  List<Object?> get props => [count];
}

final class CounterInitial extends CounterState {
  const CounterInitial();
}

final class CounterUpdated extends CounterState {
  const CounterUpdated({required super.count});
}
