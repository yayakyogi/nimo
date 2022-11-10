import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nimo/bloc/cpmk_1/cpmk_1_bloc.dart';
import 'package:nimo/bloc/set_answer/set_answer_bloc.dart';
import 'package:nimo/utils/dialog.dart';

void onSubmitQuestion({
  required BuildContext context,
  required int index,
  required int score,
}) {
  Navigator.pop(context);
  context.read<Cpmk1Bloc>().add(Cpmk1Action(
        scoreSoal: score,
        indexTes: index + 1,
      ));
  context.read<SetAnswerBloc>().add(SetAnswerEvent(
        indexAnswer: 0,
        score: 0,
      ));
  dialogResult(context: context, scoreAnswer: score);
}
