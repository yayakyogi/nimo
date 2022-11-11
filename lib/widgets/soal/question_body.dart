import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nimo/bloc/set_answer/set_answer_bloc.dart';
import 'package:nimo/themes.dart';
import 'package:nimo/widgets/button_submit.dart';
import 'package:nimo/widgets/item_soal.dart';

class QuestionBody extends StatelessWidget {
  const QuestionBody({
    Key? key,
    required this.indexAnswer,
    required this.soalText,
    required this.answerTextA,
    required this.answerTextB,
    required this.answerTextC,
    required this.answerTextD,
    required this.submitAnswerA,
    required this.submitAnswerB,
    required this.submitAnswerC,
    required this.submitAnswerD,
    required this.submitQuestion,
  }) : super(key: key);

  final int indexAnswer;
  final String soalText;

  final String answerTextA;
  final String answerTextB;
  final String answerTextC;
  final String answerTextD;

  final Function() submitAnswerA;
  final Function() submitAnswerB;
  final Function() submitAnswerC;
  final Function() submitAnswerD;

  final Function() submitQuestion;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SetAnswerBloc, SetAnswerState>(
      builder: (context, state) {
        return Container(
          height: MediaQuery.of(context).size.height - 110,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(
                  soalText,
                  style: fontPlay.copyWith(
                    fontSize: 16,
                    color: whiteColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ItemSoal(
                  soal: answerTextA,
                  isChoosen: state.indexAnswer == 1,
                  onPressed: submitAnswerA,
                ),
                ItemSoal(
                  soal: answerTextB,
                  isChoosen: state.indexAnswer == 2,
                  onPressed: submitAnswerB,
                ),
                ItemSoal(
                  soal: answerTextC,
                  isChoosen: state.indexAnswer == 3,
                  onPressed: submitAnswerC,
                ),
                ItemSoal(
                  soal: answerTextD,
                  isChoosen: state.indexAnswer == 4,
                  onPressed: submitAnswerD,
                ),
                // const SizedBox(height: 10),
                Center(
                  child: ButtonSubmit(
                    onPressed: indexAnswer > 0 ? submitQuestion : () => {},
                    title: 'Simpan Jawaban',
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
