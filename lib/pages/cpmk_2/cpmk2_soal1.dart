import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nimo/bloc/cpmk/cpmk_bloc.dart';
import 'package:nimo/bloc/set_answer/set_answer_bloc.dart';
import 'package:nimo/themes.dart';
import 'package:nimo/utils/button_submit_question.dart';
import 'package:nimo/utils/change_index_answer.dart';
import 'package:nimo/widgets/soal/question_body.dart';
import 'package:nimo/widgets/soal/question_header.dart';

class CPMK2Soal1 extends StatefulWidget {
  const CPMK2Soal1({Key? key}) : super(key: key);

  @override
  State<CPMK2Soal1> createState() => _CPMK2Soal1State();
}

class _CPMK2Soal1State extends State<CPMK2Soal1> {
  answer(abjad) {
    switch (abjad) {
      case 'A':
        return 'A.	Saya memahami makna dan penerapan tersebut di masyarakat.';
      case 'B':
        return 'B.	Saya memahami, tapi saya tidak yakin apakah demokrasi di masyarakat sudah sesuai dengan kata hati.';
      case 'C':
        return 'C.	Saya memahami, tapi saya enggan berkomentar terkait demokrasi.';
      case 'D':
        return 'D.	Saya tidak memahami dan tidak mau tahu';
      default:
        return 'Apakah kamu paham makna demokrasi dalam lingkungan masyarakat?';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CpmkBloc, CpmkState>(
      builder: (context, stateCpmk) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: AlertDialog(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            actions: [
              QuestionHeader(
                questionNumber: 1,
                onEnd: () => onSubmitQuestion(
                  cpmk: 2,
                  context: context,
                  index: stateCpmk.indexTes,
                  scoreAnswer: 0,
                  scoreGlobal: stateCpmk.scoreSoal + 0,
                ),
              ),
              BlocBuilder<SetAnswerBloc, SetAnswerState>(
                builder: (context, stateIndexAnswer) {
                  return QuestionBody(
                    indexAnswer: stateIndexAnswer.indexAnswer,
                    soalText: answer('soal'),
                    answerTextA: answer('A'),
                    answerTextB: answer('B'),
                    answerTextC: answer('C'),
                    answerTextD: answer('D'),
                    submitAnswerA: () => changeIndexAnswer(
                      context: context,
                      index: 1,
                      score: 1,
                    ),
                    submitAnswerB: () => changeIndexAnswer(
                      context: context,
                      index: 2,
                      score: 2,
                    ),
                    submitAnswerC: () => changeIndexAnswer(
                      context: context,
                      index: 3,
                      score: 3,
                    ),
                    submitAnswerD: () => changeIndexAnswer(
                      context: context,
                      index: 4,
                      score: 4,
                    ),
                    submitQuestion: () => onSubmitQuestion(
                      cpmk: 2,
                      context: context,
                      index: stateCpmk.indexTes,
                      scoreAnswer: stateIndexAnswer.score,
                      scoreGlobal: stateCpmk.scoreSoal + stateIndexAnswer.score,
                    ),
                  );
                },
              )
            ],
          ),
        );
      },
    );
  }
}
