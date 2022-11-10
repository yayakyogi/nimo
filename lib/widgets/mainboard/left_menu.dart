import 'package:flutter/material.dart';
import 'package:nimo/bloc/cpmk_1/cpmk_1_bloc.dart';
import 'package:nimo/bloc/set_answer/set_answer_bloc.dart';
import 'package:nimo/themes.dart';
import 'package:nimo/widgets/mainboard/reset_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LeftMenu extends StatelessWidget {
  const LeftMenu({
    Key? key,
    required this.title,
    required this.caracter,
  }) : super(key: key);

  final String title;
  final String caracter;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 100),
      padding: const EdgeInsets.only(top: 20, right: 10),
      width: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/icons/ic_logo.png', width: 100),
          Column(
            children: [
              Container(
                width: 80,
                height: 80,
                margin: const EdgeInsets.only(top: 130, bottom: 5),
                padding: const EdgeInsets.all(10),
                child: Image.asset(caracter),
              ),
              Text(
                'Pengertian Moral',
                style: fontPlay.copyWith(
                  color: whiteColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          ResetButton(
            onReset: () {
              context.read<Cpmk1Bloc>().add(Cpmk1Action(
                    scoreSoal: 0,
                    indexTes: 0,
                  ));
              context.read<SetAnswerBloc>().add(SetAnswerEvent(
                    indexAnswer: 0,
                    score: 0,
                  ));
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
