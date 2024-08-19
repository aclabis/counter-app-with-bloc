import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class EventIncreament extends CounterEvent {}

class EventDecreament extends CounterEvent {}
