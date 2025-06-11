import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_spark/bloc/counter/counter_cubit.dart';
import 'package:flutter_spark/bloc/counter/counter_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ThemeCubit', () {
    blocTest(
      'should emit CounterInitial when no events are added',
      build: () => CounterCubit(),
      expect: () => [],
    );

    blocTest(
      'should emit CounterInitial when reset is called',
      build: () => CounterCubit(),
      act: (cubit) => cubit.reset(),
      expect: () => [const CounterInitial()],
    );

    blocTest(
      'should increment',
      build: () => CounterCubit(),
      act: (cubit) {
        cubit.increment();
      },
      expect: () => [
        const CounterUpdated(count: 1),
      ],
    );

    blocTest(
      'should decrement',
      build: () => CounterCubit(),
      act: (cubit) {
        cubit.decrement();
      },
      expect: () => [
        const CounterUpdated(count: -1),
      ],
    );
  });
}
