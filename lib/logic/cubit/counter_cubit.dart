import 'package:bloc/bloc.dart';
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
