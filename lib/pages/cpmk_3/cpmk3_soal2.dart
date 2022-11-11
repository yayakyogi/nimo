import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nimo/bloc/cpmk/cpmk_bloc.dart';
import 'package:nimo/bloc/set_answer/set_answer_bloc.dart';
import 'package:nimo/themes.dart';
import 'package:nimo/utils/button_submit_question.dart';
import 'package:nimo/utils/change_index_answer.dart';
import 'package:nimo/widgets/soal/question_body.dart';
import 'package:nimo/widgets/soal/question_header.dart';

class CPMK3Soal2 extends StatefulWidget {
  const CPMK3Soal2({Key? key}) : super(key: key);

  @override
  State<CPMK3Soal2> createState() => _CPMK3Soal2State();
}

class _CPMK3Soal2State extends State<CPMK3Soal2> {
  answer(abjad) {
    switch (abjad) {
      case 'A':
        return 'A.	Hal yang tidak saya sukai adalah mereka terkadang menggiring opini seseorang, tapi itu hanya sebagian kecil saja, selebihnya saya sangat dekat dengan tetangga saya';
      case 'B':
        return 'B.	Hal yang saya tidak sukai adalah, prasangka warga yang mudah menjustifikasi, sehingga saya terkadang memberikan klarifikasi.';
      case 'C':
        return 'C.	Hal yang saya tidak sukai adalah, mereka sering membuat jarak dengan orang-orang yang tidak mereka sukai, seharusnya mereka merangkul';
      case 'D':
        return 'D.	Banyak hal yang tidak saya sukai, sudut pandang mereka, pola piker mereka, sikap mereka, yang seolah–olah semuanya benar.';
      default:
        return 'Hal apa yang anda tidak sukai saat bertemu tetangga atau warga sekitar anda?';
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
