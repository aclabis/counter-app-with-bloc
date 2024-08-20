import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:counter_app/blocs/counter/counter_event.dart';
import 'package:counter_app/blocs/counter/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(0)) {
    on<EventIncreament>(eventIncreament);
    on<EventDecreament>(eventDecreament);
  }

  FutureOr<void> eventIncreament(
      EventIncreament event, Emitter<CounterState> emit) {
    emit(CounterState(state.counter + 1));
  }

  FutureOr<void> eventDecreament(
      EventDecreament event, Emitter<CounterState> emit) {
    emit(CounterState(state.counter - 1));
  }
}
