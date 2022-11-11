import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nimo/bloc/cpmk/cpmk_bloc.dart';
import 'package:nimo/bloc/set_answer/set_answer_bloc.dart';
import 'package:nimo/utils/dialog.dart';

void onSubmitQuestion({
  required BuildContext context,
  required int index,
  required int scoreAnswer,
  required int scoreGlobal,
  required int cpmk,
}) {
  Navigator.pop(context);
  // save score and index materi & soal
  context.read<CpmkBloc>().add(CpmkAction(
        scoreSoal: scoreGlobal,
        indexTes: index + 1,
      ));

  // reset set answer to default
  context.read<SetAnswerBloc>().add(SetAnswerEvent(
        indexAnswer: 0,
        score: 0,
      ));

  dialogResult(context: context, scoreAnswer: scoreAnswer);
}
