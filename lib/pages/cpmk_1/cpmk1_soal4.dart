import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nimo/bloc/cpmk/cpmk_bloc.dart';
import 'package:nimo/bloc/set_answer/set_answer_bloc.dart';
import 'package:nimo/themes.dart';
import 'package:nimo/utils/button_submit_question.dart';
import 'package:nimo/utils/change_index_answer.dart';
import 'package:nimo/widgets/soal/question_body.dart';
import 'package:nimo/widgets/soal/question_header.dart';

class CPMK1Soal4 extends StatefulWidget {
  const CPMK1Soal4({Key? key}) : super(key: key);

  @override
  State<CPMK1Soal4> createState() => _CPMK1Soal4State();
}

class _CPMK1Soal4State extends State<CPMK1Soal4> {
  answer(abjad) {
    switch (abjad) {
      case 'A':
        return 'A.	Saya selalu nyaman berada di lingkungan masyarakat, Cuma memamng saya pendiam';
      case 'B':
        return 'B.	Merasa dianggap,jika tetangga mengajak saya berbicara, dan mengajak saya ikut serta tanpa paksaan.';
      case 'C':
        return 'C.	Hanya sedikit yang membuat saya nyaman, yaitu tetangga yang satu pola pikiran dengan saya.';
      case 'D':
        return 'D.	Hampir tidak ada, Karena asumsi mereka terhadap saya juga tidak ada.';
      default:
        return 'Hal-hal apa yang membuat anda nyaman saat bersa di lingkungan masyarakat?';
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
                  cpmk: 1,
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
                      cpmk: 1,
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
