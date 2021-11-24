// class CounterState {
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterState {

  CounterState({this.value = 0});
  final int value;

  // This is just a simple utility method, you might want to try out freezed
  // for more complex implementations
  CounterState copyWith({required int count}) {
    return CounterState(
      value: count ?? this.value
    );
  }

}

class CounterNotifier extends StateNotifier<CounterState> {
  CounterNotifier() : super(CounterState());

  increase() => state = state.copyWith(count: state.value + 1);
  decrease() => state = state.copyWith(count: state.value - 1);
}