import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class NumberTriviaBloc extends Bloc<NumberTriviaEvent, NumberTriviaState> {
  @override
  NumberTriviaState get initialState => InitialNumberTriviaState();

  @override
  Stream<NumberTriviaState> mapEventToState(
    NumberTriviaEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
