part of 'set_answer_bloc.dart';

@immutable
abstract class SetAnswerEventAbstract {}

class SetAnswerEvent extends SetAnswerEventAbstract {
  final int indexAnswer;
  final int score;

  SetAnswerEvent({required this.indexAnswer, required this.score});
}
