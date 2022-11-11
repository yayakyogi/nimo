import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nimo/bloc/cpmk/cpmk_bloc.dart';
import 'package:nimo/bloc/set_answer/set_answer_bloc.dart';
import 'package:nimo/themes.dart';
import 'package:nimo/utils/button_submit_question.dart';
import 'package:nimo/utils/change_index_answer.dart';
import 'package:nimo/widgets/soal/question_body.dart';
import 'package:nimo/widgets/soal/question_header.dart';

class CPMK3Soal3 extends StatefulWidget {
  const CPMK3Soal3({Key? key}) : super(key: key);

  @override
  State<CPMK3Soal3> createState() => _CPMK3Soal3State();
}

class _CPMK3Soal3State extends State<CPMK3Soal3> {
  answer(abjad) {
    switch (abjad) {
      case 'A':
        return 'A.	Hal yang pertama saya jelaskan adalah menemui ketua RT dan menjelaskan ketidakhadiran saya, dan menjelaskan kabar yang beredar itu tidak benar.';
      case 'B':
        return 'B.	Saya akan menceritakan kepada tetangga yang terdekat, dan mengatakan itu adalah opini yang terbentuk dari salah satu warga, dan saya bukan orang seperti itu';
      case 'C':
        return 'C.	Saya tidak peduli, jika tetangga bertanya akan saya jawab bahwa saya sedang ada kesibukan, mereka hanya tahu saya sebagian kecil.';
      case 'D':
        return 'D.	Saya marah, dan akan lebih acuh kepada mereka.';
      default:
        return 'Seandainya ada tidak bisa hadir dalam acara yang diadakan RT anda, semisal kerja bakti, dan terdengar kabar di masyarakat bahwa anda acuh tak acuh terhadap kegiatan RT di lingkungan. Bagaimana sikap anda?';
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
                questionNumber: 3,
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
