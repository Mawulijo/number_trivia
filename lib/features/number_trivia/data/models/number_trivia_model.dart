import 'package:meta/meta.dart';
import '../../domain/entities/number_trivia.dart';
import 'package:json_annotation/json_annotation.dart';

part 'number_trivia_model.g.dart';

@JsonSerializable()
class NumberTriviaModel extends NumberTrivia {
  NumberTriviaModel({
    @required String text,
    @required int number,
  }) : super(text: text, number: number);

  // factory NumberTriviaModel.fromJson(Map<String, dynamic> json) {
  //   return NumberTriviaModel(
  //       text: json['text'], number: (json['number'] as num).toInt());
  // }

  // using the json_annotation package
  factory NumberTriviaModel.fromJson(Map<String, dynamic> json) =>
      _$NumberTriviaModelFromJson(json);

  // Map<String, dynamic> toJson() {
  //   return {
  //     'text': text,

  // using the json_annotation package
  Map<String, dynamic> toJson() => _$NumberTriviaModelToJson(this);
}
