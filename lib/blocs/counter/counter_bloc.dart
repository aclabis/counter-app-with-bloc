import 'package:bloc/bloc.dart';
import 'package:counter_app/blocs/counter/counter_event.dart';
import 'package:counter_app/blocs/counter/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(0)) {
    on<EventIncreament>((event, emit) => emit(CounterState(state.counter + 1)));
    on<EventDecreament>((event, emit) => emit(CounterState(state.counter - 1)));
  }
}
