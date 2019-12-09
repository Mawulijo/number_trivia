import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  // If the subclasses have some properties, they'll get passed to this constructor
  // so that Equatable can perform value comparison.
  // Failure([List properties = const <dynamic>[]]) : super(properties);
  @override
  List<Object> get props => [];
}

// General failures
class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class Person extends Equatable {
  final String name;

  Person(this.name);

  @override
  List<Object> get props => [name];
}
