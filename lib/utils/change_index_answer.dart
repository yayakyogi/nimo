import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nimo/bloc/set_answer/set_answer_bloc.dart';

void changeIndexAnswer({
  required BuildContext context,
  required int index,
  required int score,
}) {
  context.read<SetAnswerBloc>().add(SetAnswerEvent(
        indexAnswer: index,
        score: score,
      ));
}
