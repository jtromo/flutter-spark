import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spark/bloc/counter/counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterInitial());

  void increment() => emit(CounterUpdated(count: state.count + 1));
  void decrement() => emit(CounterUpdated(count: state.count - 1));
  void reset() => emit(const CounterInitial());
}
