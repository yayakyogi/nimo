import 'package:flutter/material.dart';
import 'package:nimo/themes.dart';
import 'package:nimo/widgets/countdown.dart';

class QuestionHeader extends StatelessWidget {
  const QuestionHeader({
    Key? key,
    required this.questionNumber,
    required this.onEnd,
  }) : super(key: key);

  final int questionNumber;
  final Function() onEnd;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Soal $questionNumber',
            style: fontPlay.copyWith(
              fontSize: 20,
              color: whiteColor,
              fontWeight: FontWeight.w800,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(width: 20),
          TimeCountdown(
            color: whiteColor,
            onEnd: onEnd,
          ),
        ],
      ),
    );
  }
}
