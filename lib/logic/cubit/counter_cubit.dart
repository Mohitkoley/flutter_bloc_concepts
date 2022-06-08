import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
part 'counter_state.dart';

class CounterCubit extends HydratedCubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0, wasIncremented: false));

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncremented: true));
  void decrement() {
    if (state.counterValue > 0) {
      return emit(CounterState(
          counterValue: state.counterValue - 1, wasIncremented: false));
    }
    return reset();
  }

  void reset() => emit(CounterState(
      counterValue: state.counterValue = 0, wasIncremented: false));

  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toJson(CounterState state) {
    throw UnimplementedError();
  }
}
