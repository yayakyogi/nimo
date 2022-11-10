part of 'set_answer_bloc.dart';

@immutable
abstract class SetAnswerState {
  final int indexAnswer;
  final int score;

  const SetAnswerState({this.indexAnswer = 0, this.score = 0});
}

class SetAnswerInitial extends SetAnswerState {
  const SetAnswerInitial() : super(indexAnswer: 0, score: 0);
}

class SetAnswerLoaded extends SetAnswerState {
  final int getIndexAnswer;
  final int getScore;

  const SetAnswerLoaded({required this.getIndexAnswer, required this.getScore})
      : super(indexAnswer: getIndexAnswer, score: getScore);
}
