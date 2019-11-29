import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:number_trivia/core/presentation/util/input_converter.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:number_trivia/features/number_trivia/domain/use_cases/get_concrete_number_trivia.dart';
import 'package:number_trivia/features/number_trivia/domain/use_cases/get_random_number_trivia.dart';
import 'package:number_trivia/features/number_trivia/presentation/bloc/bloc/bloc.dart';

class MockGetConcreteNumberTrivia extends Mock
    implements GetConcreteNumberTrivia {}

class MockGetRandomNumberTrivia extends Mock implements GetRandomNumberTrivia {}

class MockInputConverter extends Mock implements InputConverter {}

void main() {
  NumberTriviaBloc bloc;
  MockGetConcreteNumberTrivia mockGetConcreteNumberTrivia;
  MockGetRandomNumberTrivia mockGetRandomNumberTrivia;
  MockInputConverter mockInputConverter;

  setUp(() {
    mockGetConcreteNumberTrivia = MockGetConcreteNumberTrivia();
    mockGetRandomNumberTrivia = MockGetRandomNumberTrivia();
    mockInputConverter = MockInputConverter();

    bloc = NumberTriviaBloc(
      concrete: mockGetConcreteNumberTrivia,
      random: mockGetRandomNumberTrivia,
      inputConverter: mockInputConverter,
    );
  });
  test('initiatedState should be Empty', () {
    //assert
    expect(bloc.initialState, equals(Empty()));
  });
  group('GetTriviaForConcreteNumber', () {
    // Thte event takes in a string
    final tNumberString = '1';
    // This is the successful output of the InputConverter
    final tNumberParsed = int.parse(tNumberString);
    // NumberTrivia instance is needed too
    final tNumberTrivia = NumberTrivia(number: 1, text: 'test trivia');
    test(
        'should call the Inputconverter to validate and convert string to an unsigned integer',
        () async {
      //arrange
      when(mockInputConverter.stringToUnsignedInteger(any))
          .thenReturn(Right(tNumberParsed));
      //act
      bloc.dispatch(GetTriviaForConcreteNumber(tNumberString));
      await untilCalled(mockInputConverter.stringToUnsignedInteger(any));
      //assert
      verify(mockInputConverter.stringToUnsignedInteger(tNumberString));
    });
    test('should emit [error] when the input is invalid', () async {
      //arrange
      when(mockInputConverter.stringToUnsignedInteger(any))
          .thenReturn(Left(InvalidInputFailure()));
      //assert later
      final expected = [
        //The inintial state is always emitted first
        Empty(),
        Error(message: INVALID_INPUT_FAILURE_MESSAGE)
      ];
      expectLater(bloc.state, emitsInOrder(expected));
      //act
      bloc.dispatch(GetTriviaForConcreteNumber(tNumberString));
    });
  });
}
