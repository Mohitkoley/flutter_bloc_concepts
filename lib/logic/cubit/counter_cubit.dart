import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc_concepts/constants/enums.dart';
import 'package:flutter_bloc_concepts/logic/cubit/internet_cubit.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
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
}
