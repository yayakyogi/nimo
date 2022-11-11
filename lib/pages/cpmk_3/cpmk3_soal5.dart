import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nimo/bloc/cpmk/cpmk_bloc.dart';
import 'package:nimo/bloc/set_answer/set_answer_bloc.dart';
import 'package:nimo/themes.dart';
import 'package:nimo/utils/button_submit_question.dart';
import 'package:nimo/utils/change_index_answer.dart';
import 'package:nimo/widgets/soal/question_body.dart';
import 'package:nimo/widgets/soal/question_header.dart';

class CPMK3Soal5 extends StatefulWidget {
  const CPMK3Soal5({Key? key}) : super(key: key);

  @override
  State<CPMK3Soal5> createState() => _CPMK3Soal5State();
}

class _CPMK3Soal5State extends State<CPMK3Soal5> {
  answer(abjad) {
    switch (abjad) {
      case 'A':
        return 'A.	Saya akan tetap silaturahmi kepada tetangga dan ketua RT, meskipun mereka tidak menganggap saya ada.';
      case 'B':
        return 'B.	Saya tidak masalah, yang terpenting tetap menjaga komunikasi, meskipun tidak dianggap.';
      case 'C':
        return 'C.	Saya tidak peduli,mereka menganggap saya ada, saya bersyukur, jika menganggap saya tidak ada juga tidak berpengaruh dalam hidup saya.';
      case 'D':
        return 'D.	Saya bahagia sekali, itu membuat saya bebas dan tenang.';
      default:
        return 'Jika anda, termarjinalkan pada lingkungan anda, dikarenakan satu atau dua orang tetangga, melabeli anda sebagai orang anti sosial, apakah tindakan anda?';
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
                questionNumber: 4,
                onEnd: () => onSubmitQuestion(
                  cpmk: 3,
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
                      cpmk: 3,
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
