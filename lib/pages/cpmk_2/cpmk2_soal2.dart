import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nimo/bloc/cpmk/cpmk_bloc.dart';
import 'package:nimo/bloc/set_answer/set_answer_bloc.dart';
import 'package:nimo/themes.dart';
import 'package:nimo/utils/button_submit_question.dart';
import 'package:nimo/utils/change_index_answer.dart';
import 'package:nimo/widgets/soal/question_body.dart';
import 'package:nimo/widgets/soal/question_header.dart';

class CPMK2Soal2 extends StatefulWidget {
  const CPMK2Soal2({Key? key}) : super(key: key);

  @override
  State<CPMK2Soal2> createState() => _CPMK2Soal2State();
}

class _CPMK2Soal2State extends State<CPMK2Soal2> {
  answer(abjad) {
    switch (abjad) {
      case 'A':
        return 'A.	Saya berlapang dada, karena itu adalah sikap demokrasi';
      case 'B':
        return 'B.	Saya menerima, dan saya diam saja.';
      case 'C':
        return 'C.	Saya kecewa, dan saya tanyakan kepada panitia acara.';
      case 'D':
        return 'D.	Saya marah, dan tidak percaya pada panitia acara';
      default:
        return 'Seandainya ada kegiatan masyarakat, dan pilihan anda terhadap sesuatu tidak sesuai harapan. Apa yang anda lakukan?';
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
                questionNumber: 2,
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
