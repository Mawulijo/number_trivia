import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class NumberTriviaEvent extends Equatable {
  // List<Object> get props => [];
  @override
  List<Object> get props => const <dynamic>[];
}

class GetTriviaForConcreteNumber extends NumberTriviaEvent {
  final String numberString;
  GetTriviaForConcreteNumber(this.numberString);
  // GetTriviaForConcreteNumber(this.numberString) : super([numberString]);
}

class GetTriviaForRandomNumber extends NumberTriviaEvent {}
