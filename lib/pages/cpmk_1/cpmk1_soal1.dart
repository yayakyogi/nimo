import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nimo/bloc/cpmk_1/cpmk_1_bloc.dart';
import 'package:nimo/bloc/set_answer/set_answer_bloc.dart';
import 'package:nimo/themes.dart';
import 'package:nimo/utils/button_submit_question.dart';
import 'package:nimo/utils/change_index_answer.dart';
import 'package:nimo/widgets/soal/question_body.dart';
import 'package:nimo/widgets/soal/question_header.dart';

class CPMK1Soal1 extends StatefulWidget {
  const CPMK1Soal1({Key? key}) : super(key: key);

  @override
  State<CPMK1Soal1> createState() => _CPMK1Soal1State();
}

class _CPMK1Soal1State extends State<CPMK1Soal1> {
  answer(abjad) {
    switch (abjad) {
      case 'A':
        return 'A.	Bisa, saya paham mana hal yang baik dan buruk dalam masyarakat';
      case 'B':
        return 'B.	Bisa, tapi tidak semua hal baik itu cocok menurut saya.';
      case 'C':
        return 'C.	Bisa, tapi saya tidak suka aturan di masyarakat.';
      case 'D':
        return 'D.	Tidak bisa karena saya tidak peduli';
      default:
        return 'Apakah anda bisa membedakan mana yang baik dan buruk pada aturan di masyarakat?';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Cpmk1Bloc, Cpmk1State>(
      builder: (context, state) {
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
                  context: context,
                  index: state.indexTes,
                  score: 0,
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
                      context: context,
                      index: state.indexTes,
                      score: stateIndexAnswer.score,
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
