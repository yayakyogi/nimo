import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nimo/bloc/cpmk_1/cpmk_1_bloc.dart';
import 'package:nimo/bloc/set_answer/set_answer_bloc.dart';
import 'package:nimo/themes.dart';
import 'package:nimo/utils/button_submit_question.dart';
import 'package:nimo/utils/change_index_answer.dart';
import 'package:nimo/widgets/soal/question_body.dart';
import 'package:nimo/widgets/soal/question_header.dart';

class CPMK1Soal5 extends StatefulWidget {
  const CPMK1Soal5({Key? key}) : super(key: key);

  @override
  State<CPMK1Soal5> createState() => _CPMK1Soal5State();
}

class _CPMK1Soal5State extends State<CPMK1Soal5> {
  answer(abjad) {
    switch (abjad) {
      case 'A':
        return 'A.	Saya merasakan aturan dibuat untuk ditaati.';
      case 'B':
        return 'B.	Saya merasakan, ada beberapa aturan yang membuat saya kurang nyaman.';
      case 'C':
        return 'C.	Saya merasakan beberapa aturan sifatnya agak memaksa, seperti harus kerja bakti, padahal bangun saya kesiangan';
      case 'D':
        return 'D.	Aturan itu memaksa saya tertekan, saya tidak bisa berosialisasi dengan mereka.';
      default:
        return 'Apa yang kamu rasakan selama ini dengan norma dan etika di lingkungan masyarakat?';
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
                questionNumber: 4,
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
