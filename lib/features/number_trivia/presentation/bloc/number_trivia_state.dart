import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/number_trivia.dart';

@immutable
abstract class NumberTriviaState extends Equatable {
  // NumberTriviaState([List props = const <dynamic>[]]) : super(props);
  @override
  List<Object> get props => const <dynamic>[];
}

class Empty extends NumberTriviaState {}

class Loading extends NumberTriviaState {}

class Loaded extends NumberTriviaState {
  final NumberTrivia trivia;

  Loaded({@required this.trivia});
  List<Object> get props => [trivia];
}

class Error extends NumberTriviaState {
  final String message;

  Error({@required this.message});
  List<Object> get props => [message];
}
